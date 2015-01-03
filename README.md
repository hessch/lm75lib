# **lm75.lua** #
version 0.1

#### LM75 Library for NodeMCU
lm75.lua Is a small library to read temeratures from a LM75 i2c
temperature sensor connected to an ESP8266 running the [NodeMCU
Lua firmware](http://www.nodemcu.com).

## Change Log
2015-01-01: initial version

## Usage
Save the library to NodeMCU as 'lm75.lua', the LM75 can then 
be initialized with the GPIO indexes for the SDA and SCL signals:

```lua
	require('lm75')
	
	sda, scl = 4, 3
	lm75:init(sda, scl)
```

After initialisation, two methods are available for reading the
temperature from the module, strTemp() and intTemp(), these return
the temperature respectively as string representing a floating point
number or the temperature scaled to an integer (divide this integer
by 10 to get the temperature in degrees Celcuis.)

# Example
```
> =lm75:strTemp()
22.5

> =lm75:intTemp()
225
```
