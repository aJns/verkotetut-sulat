#include "ets_sys.h"
#include "osapi.h"
#include "gpio.h"
#include "os_type.h"
#include "user_interface.h"


static const int pin = 4;
static volatile os_timer_t some_timer;

void some_timerfunc(void)
{
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

// ICACHE_FLASH_ATTR merkityt funktiot ladataan RAMmiin tarvittaessa, muut bootissa
void ICACHE_FLASH_ATTR
init_done(void)
{
    gpio_output_set(0, 0, (1 << pin), 0);

    // setup timer (500ms, repeating)
    os_timer_setfn(&some_timer, (os_timer_func_t *)some_timerfunc, NULL);
    os_timer_arm(&some_timer, 500, 1);

    const char ssid[32] = "Koti_0A0C";
    const char password[32] = "XHK49JNXVCCAT";

    struct station_config stationConf;

    wifi_set_opmode( STATION_MODE );
    os_memcpy(&stationConf.ssid, ssid, 32);
    os_memcpy(&stationConf.password, password, 32);
    wifi_station_set_config(&stationConf);
    wifi_station_connect();
}

    void ICACHE_FLASH_ATTR
user_init(void)
{
    system_init_done_cb(init_done);
}
