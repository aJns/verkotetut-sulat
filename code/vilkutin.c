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

const char wifi_ssid[32] = "tottoroo";
const char wifi_passwd[32] = "pekkalanit77";

const char *api_path = "/api.php";
const char *server_hostname = "arch_mini";
const int server_port = 80;

static const int led_pin = 4; 
static const int button_pin = 5; 
static const int button_counter_max = 10; 
static int led_status = 0;
static int button_counter = 0;
static int connection_defined = 0;
static int toggle_led = 0;
static os_timer_t check_timer;
static const uint32_t check_timer_interval = 100;
static struct espconn conn1;
static esp_tcp tcp1;
static ip_addr_t server_ip;

void ICACHE_FLASH_ATTR set_led_on(void)
{
    led_status = 1;
    gpio_output_set((1 << led_pin), 0, 0, 0);
}

void ICACHE_FLASH_ATTR set_led_off(void)
{
    led_status = 0;
    gpio_output_set(0, (1 << led_pin), 0, 0);
}

void ICACHE_FLASH_ATTR send_get_request(struct espconn *conn)
{
    const char *method = "GET";
    const char *headers = "";
    const char *post_headers = "";

    char buf[69 + strlen(method) + strlen(api_path) + strlen(server_hostname) +
        strlen(headers) + strlen(post_headers)];
    int len = os_sprintf(buf,
                         "%s %s HTTP/1.1\r\n"
                         "Host: %s:%d\r\n"
                         "Connection: close\r\n"
                         "User-Agent: ESP8266\r\n"
                         /* "%s" */
                         /* "%s" */
                         "\r\n",
                         method, api_path, server_hostname, server_port, headers, post_headers);

    /* os_printf("Sending request:\r\n\n"); */
    /* os_printf(buf); */

    espconn_send(conn, (uint8_t *)buf, len);
}

void ICACHE_FLASH_ATTR send_post_request(struct espconn *conn, int led_state)
{
    const char *method = "POST";
    const char *post_headers = "Content-Length: 11\r\nContent-Type: application/x-www-form-urlencoded";
    const char content[32];

    os_sprintf(content, "led_state=%d\r\n\r\n", led_state);

    char buf[69 + strlen(method) + strlen(api_path) + strlen(server_hostname) +
        strlen(post_headers) + strlen(content)];
    int len = os_sprintf(buf,
                         "%s %s HTTP/1.1\r\n"
                         "Host: %s:%d\r\n"
                         "Connection: close\r\n"
                         "User-Agent: ESP8266\r\n"
                         "%s"
                         "\r\n"
                         "\r\n"
                         "%s"
                         "\r\n",
                         method, api_path, server_hostname, server_port, post_headers, content);

    os_printf("Sending POST request:\r\n\n");
    os_printf(buf);

    espconn_send(conn, (uint8_t *)buf, len);
}

void ICACHE_FLASH_ATTR server_responded(void *arg, char *buf, unsigned short len)
{
    struct espconn * conn = (struct espconn *)arg;

    if (buf == NULL) {
        return;
    }

    os_printf("Server responded with:\r\n\n");
    os_printf(buf);

    char led_state = '0';
    char *keyword = "[led_state]";
    int key_length = strlen(keyword);
    int key_counter = 0;
    int i;
    for(i = 0; i < len; i++)
    {
        if (key_counter == key_length)
        {
            led_state = buf[i];
            /* os_printf("Led state is: %c\r\n\n", buf[i]); */

            break;
        }

        if (buf[i] == keyword[key_counter])
        {
            key_counter++;
        }
        else
        {
            key_counter = 0;
        }
    }

    if (led_state == '1')
        set_led_on();
    else
        set_led_off();
}

void ICACHE_FLASH_ATTR connect_to_server(void)
{
    if (espconn_connect(&conn1) != 0)
    {
    }
}

void ICACHE_FLASH_ATTR toggle_led_state(void)
{
    button_counter = 0;

    if (connection_defined != 1)
    {
        return;
    }

    if (led_status == 1)
    {
        send_post_request(&conn1, 0);
    }
    else
    {
        send_post_request(&conn1, 1);
    }
    toggle_led = 0;
}

void ICACHE_FLASH_ATTR connected_to_server(void *arg)
{
    /* os_printf("Connected\n"); */
    struct espconn * conn = (struct espconn *)arg;
    /* request_args * req = (request_args *)conn->reverse; */

    espconn_regist_recvcb(conn, server_responded);
    /* espconn_regist_sentcb(conn, sent_callback); */
    if (toggle_led)
        toggle_led_state();
    else
        send_get_request(conn);
}

void ICACHE_FLASH_ATTR disconnected_from_server(void *arg)
{
    /* connect_to_server(); */
}

    LOCAL void ICACHE_FLASH_ATTR
user_esp_platform_dns_found(const char *name, ip_addr_t *ipaddr, void *arg)
{
    if (ipaddr != NULL)
    {
        tcp1.remote_port = server_port;
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

        connection_defined = 1;

        connect_to_server();
    }
}

    LOCAL void ICACHE_FLASH_ATTR
wifi_connected(System_Event_t *event)
{
    if (event->event == EVENT_STAMODE_GOT_IP )
    {
        espconn_gethostbyname(&conn1, server_hostname, &server_ip, user_esp_platform_dns_found);
    }

    if (event->event == EVENT_STAMODE_DISCONNECTED)
    {
        /* set_led_off(); */
    }
}

void ICACHE_FLASH_ATTR check_timerfunc(void)
{
    uint32 gpio_status = GPIO_INPUT_GET(button_pin);
    if (gpio_status == 1)// && button_counter > button_counter_max)
    {
        os_printf("\r\nButton pressed!\r\n");
        // button pressed
        toggle_led = 1;
    }
    else
    {
        if (button_counter <= 2*button_counter_max)
        {
            button_counter++;
        }

        if (conn1.state == ESPCONN_NONE || conn1.state == ESPCONN_CLOSE)
        {
            connect_to_server();
        }
    }
}

// ICACHE_FLASH_ATTR merkityt funktiot ladataan RAMmiin tarvittaessa, muut bootissa
    void ICACHE_FLASH_ATTR
init_done(void)
{
    gpio_output_set(0, 0, (1 << led_pin), 0);
    gpio_output_set(0, 0, 0, (1 << button_pin));

    os_timer_setfn(&check_timer, (os_timer_func_t *)check_timerfunc, NULL);
    os_timer_arm(&check_timer, check_timer_interval, 1);

    struct station_config stationConf;

    wifi_set_opmode( STATION_MODE );
    os_memcpy(&stationConf.ssid, wifi_ssid, 32);
    os_memcpy(&stationConf.password, wifi_passwd, 32);
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
