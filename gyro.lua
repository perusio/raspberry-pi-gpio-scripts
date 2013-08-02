#!/usr/bin/env lua

-- gyro.lua --- Minimal script to write to a GPIO of the raspberry pi.

-- Copyright (C) 2013 António P. P. Almeida <appa@perusio.net>

-- Author: António P. P. Almeida <appa@perusio.net>

-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the "Software"),
-- to deal in the Software without restriction, including without limitation
-- the rights to use, copy, modify, merge, publish, distribute, sublicense,
-- and/or sell copies of the Software, and to permit persons to whom the
-- Software is furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.

-- Except as contained in this notice, the name(s) of the above copyright
-- holders shall not be used in advertising or otherwise to promote the sale,
-- use or other dealings in this Software without prior written authorization.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
-- THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-- DEALINGS IN THE SOFTWARE.

local rpi_lib_path

-- First test which environment we're on.
if os.getenv('HOME') == '/home/pi' then
   rpio_lib_path = '/home/pi/perusio/lua-rpio-gpio/?.lua'
else
   rpio_lib_path = '/home/perusio/lua/lua-rpio-gpio/?.lua'
end

-- Set the proper package path in order to load the Pi library.
package.path = string.format('%s;%s', rpio_lib_path, package.path)

local gpio = require('rpi.gpio')

-- Get the value of the argument.
local period = arg[1] or 15

-- Set the GPIO pin 0 value.
gpio.pin[0] = 1
gpio.msleep(1000 * period)
gpio.pin[0] = 0
