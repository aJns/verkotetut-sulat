#include "ets_sys.h"
#include "osapi.h"
#include "gpio.h"
#include "os_type.h"
#include "user_interface.h"
#include "espconn.h"
#include "driver/uart.h"
#include "mem.h"
#include "limits.h"
#include "user_config.h"

/* typedef void (* http_callback)(char * response_body, int http_status, char * response_headers, int body_size); */

/* typedef struct { */
/* 	char * path; */
/* 	int port; */
/* 	char * post_data; */
/* 	char * headers; */
/* 	char * hostname; */
/* 	char * buffer; */
/* 	int buffer_size; */
/* 	bool secure; */
/* 	http_callback user_callback; */
/* } request_args; */

static int error_blink = 0;
static const int pin = 4; 
static os_timer_t some_timer;
static struct espconn conn1;
static esp_tcp tcp1;
static ip_addr_t server_ip;

void ICACHE_FLASH_ATTR some_timerfunc(void)
{
    if (error_blink == 0)
    {
        return;
    }
    //Do blinky stuff
    if (GPIO_REG_READ(GPIO_OUT_ADDRESS) & (1 << pin))
    {
        // set gpio low
        gpio_output_set(0, (1 << pin), 0, 0);
    }
    else
    {
        // set gpio high
        gpio_output_set((1 << pin), 0, 0, 0);
    }
}

void ICACHE_FLASH_ATTR set_led_on(void)
{
    error_blink = 0;
    gpio_output_set((1 << pin), 0, 0, 0);
}

void ICACHE_FLASH_ATTR set_led_off(void)
{
    error_blink = 0;
    gpio_output_set(0, (1 << pin), 0, 0);
}

void ICACHE_FLASH_ATTR server_responded(void *arg, char *buf, unsigned short len)
{
	struct espconn * conn = (struct espconn *)arg;

	if (buf == NULL) {
		return;
	}

        os_printf(buf);
}

void ICACHE_FLASH_ATTR connected_to_server(void *arg)
{
    os_printf("Connected\n");
    struct espconn * conn = (struct espconn *)arg;
    /* request_args * req = (request_args *)conn->reverse; */

    espconn_regist_recvcb(conn, server_responded);
    /* espconn_regist_sentcb(conn, sent_callback); */

    os_printf("espconn pointer address:   ");
    os_printf("%p", conn);

    const char *method = "GET";
    const char *path = "/api.html";
    const char *hostname = "arch_mini";
    const char *port = "80";
    const char *headers = "";
    const char *post_headers = "";

    char buf[69 + strlen(method) + strlen(path) + strlen(hostname) +
        strlen(headers) + strlen(post_headers)];
    int len = os_printf(buf,
                         "%s %s HTTP/1.1\r\n"
                         "Host: %s:%d\r\n"
                         "Connection: close\r\n"
                         "User-Agent: ESP8266\r\n"
                         "%s"
                         "%s"
                         "\r\n",
                         method, path, hostname, port, headers, post_headers);

    /* if (req->secure) */
    /*     /1* espconn_secure_send(conn, (uint8_t *)buf, len); *1/ */
    /* else */
    espconn_send(conn, (uint8_t *)buf, len);
    os_printf("Sending request header\n");
}

void ICACHE_FLASH_ATTR disconnected_from_server(void *arg)
{
    set_led_off();
}

    LOCAL void ICACHE_FLASH_ATTR
user_esp_platform_dns_found(const char *name, ip_addr_t *ipaddr, void *arg)
{
    if (ipaddr != NULL)
    {
        tcp1.remote_port = 80;
        tcp1.remote_ip[0] = ip4_addr1(ipaddr);
        tcp1.remote_ip[1] = ip4_addr2(ipaddr);
        tcp1.remote_ip[2] = ip4_addr3(ipaddr);
        tcp1.remote_ip[3] = ip4_addr4(ipaddr);

        os_printf("Server ip address: %u.%u.%u.%u",
                  ip4_addr1(ipaddr),
                  ip4_addr2(ipaddr),
                  ip4_addr3(ipaddr),
                  ip4_addr4(ipaddr));


        tcp1.local_port = espconn_port();
        struct ip_info ipconfig;
        wifi_get_ip_info(STATION_IF, &ipconfig);
        os_memcpy(tcp1.local_ip, &ipconfig.ip, 4);
        conn1.type = ESPCONN_TCP;
        conn1.state = ESPCONN_NONE;
        conn1.proto.tcp = &tcp1;

        espconn_regist_disconcb(&conn1, disconnected_from_server);
        espconn_regist_connectcb(&conn1, connected_to_server);

        if (espconn_connect(&conn1) != 0)
        {
            error_blink = 1;
        }
    }
}

    LOCAL void ICACHE_FLASH_ATTR
wifi_connected(System_Event_t *event)
{
    if (event->event == EVENT_STAMODE_GOT_IP )
    {
        espconn_gethostbyname(&conn1, "arch_mini", &server_ip, user_esp_platform_dns_found);
    }

    if (event->event == EVENT_STAMODE_DISCONNECTED)
    {
        set_led_off();
    }
}

// ICACHE_FLASH_ATTR merkityt funktiot ladataan RAMmiin tarvittaessa, muut bootissa
    void ICACHE_FLASH_ATTR
init_done(void)
{
    gpio_output_set(0, 0, (1 << pin), 0);

    // setup timer (500ms, repeating)
    os_timer_setfn(&some_timer, (os_timer_func_t *)some_timerfunc, NULL);
    os_timer_arm(&some_timer, 100, 1);

    const char ssid[32] = "Koti_0A0C";
    const char password[32] = "XHK49JNXVCCAT";

    struct station_config stationConf;

    wifi_set_opmode( STATION_MODE );
    os_memcpy(&stationConf.ssid, ssid, 32);
    os_memcpy(&stationConf.password, password, 32);
    wifi_station_set_config(&stationConf);
    wifi_set_event_handler_cb(wifi_connected);
    wifi_station_connect();

    os_printf("Init done\r\n");
}

    void ICACHE_FLASH_ATTR
user_init(void)
{
    system_init_done_cb(init_done);

    uart_init(BIT_RATE_115200, BIT_RATE_115200);
}