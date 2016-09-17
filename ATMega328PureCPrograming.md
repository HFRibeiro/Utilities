# ATMega328 Pure C Programing for Linux

* Instalations:
  * sudo apt-get install gcc-avr
  * sudo apt-get install avr-libc
  * sudo apt-get install avrdude
  
* Compile comands:
  * $ avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o led.o led.c
  * $ avr-gcc -mmcu=atmega328p led.o -o led
  * $ avr-objcopy -O ihex -R .eeprom led led.hex
  
* Uploading:
  * $ avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:led.hex
  
* (Extra) backup code from atmega328:
  * $ avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:r:flash_backup.hex:i

* led.c code:
```c
#include <avr/io.h>
#include <util/delay.h>
 
#define BLINK_DELAY_MS 1000
 
int main (void)
{
 /* set pin 5 of PORTB for output*/
 DDRB |= _BV(DDB5);
 
 while(1) {
  /* set pin 5 high to turn led on */
  PORTB |= _BV(PORTB5);
  _delay_ms(BLINK_DELAY_MS);
 
  /* set pin 5 low to turn led off */
  PORTB &= ~_BV(PORTB5);
  _delay_ms(BLINK_DELAY_MS);
 }
}
```
