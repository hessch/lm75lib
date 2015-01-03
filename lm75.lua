-- lm75.lua - NodeMCU Library for LM75 i2c temperature sensors
-- version 0.1, Hessel Schut, hessel@isquared.nl, 2015-01-03

lm75 = {
	address = 71,
	temp_reg = 0,

	init = function (self, sda, scl)
		self.bus = 0
		i2c.setup(self.bus, sda, scl, i2c.SLOW)
	end,

	read = function (self)
		i2c.start(self.bus)
		i2c.address(self.bus, self.address, i2c.TRANSMITTER)
		i2c.write(self.bus, self.temp_reg)
		i2c.stop(self.bus)

		i2c.start(self.bus)
		i2c.address(self.bus, self.address + 1, i2c.RECEIVER)
		c=i2c.read(self.bus, 2)
		i2c.stop(self.bus)
		return c
	end,

	strTemp = function (self)
		local h,l 
		h,l = string.byte(self:read(), 1, 2)
		if l>127 then l=5 else l=0 end
		return string.format("%d.%d", h,l)
	end,

	intTemp = function (self)
		local h,l 
		h,l = string.byte(self:read(), 1, 2)
		if l>127 then l=5 else l=0 end
		return tonumber(string.format("%d%d", h,l))
	end
}
