---@meta

---This set of math function uses the standard Lua 5.1 math library (which calls the standard C library).
---@class math
---@field inf number
---@field pi number
---@field huge number
math = {}

---  Returns the hyperbolic tangent of `x`. 
--- @param x number A number.
--- @return number
function math.tanh(x) end

---  Returns the tangent of `x` (the angle in radians). 
--- @param x number The angle in radians.
--- @return number
function math.tan(x) end

---  Returns the square root of `x` (equivalent to the expression `x^0.5`). 
--- @param x number A number.
--- @return number
function math.sqrt(x) end

---  Returns the hyperbolic sine of `x`. 
--- @param x number A number.
--- @return number
function math.sinh(x) end

---  Returns the sine of `x` (the angle in radians). The result is a number in the range `[-1, 1]`. 
--- @param x number The angle in radians.
--- @return number
function math.sin(x) end

---  Returns the integer larger than or equal to `x`. 
--- @param x number A number.
--- @return number
function math.ceil(x) end

---  Converts to radians an angle given in degrees. 
--- @param x number An angle in degrees.
--- @return number
function math.rad(x) end

---  Rounds number to the nearest integer following the same rules as the JavaScript version, i.e. if the fractional portion of number is `0.5` or greater, the argument is rounded to the next higher integer. If the fractional portion of number is less than `0.5`, the argument is rounded to the next lower integer. 
--- @param x number The number to round.
--- @return number
function math.round(x) end

---  Returns the arc cosine of `x` in radians. The result will be in the range `0` to `pi`. If the parameter `x` is outside the range `[-1..1]`, the result will be `NaN`. 
--- @param x number A number.
--- @return number
function math.acos(x) end

---  Return the minimum value among its arguments. 
--- @param x number A number.
--- @return number
function math.min(x) end

---  Sets the "seed" for the pseudo-random number generator. The same seed will produce the same sequence of random numbers each time and can be useful for testing but it is generally more desirable to have a different sequence for each run by using something like the current time as the seed (see&nbsp;below).  
--- @param seed number A number.
function math.randomseed(seed) end

---  Convert a value from radians to degrees. 
--- @param x number An angle in radians.
--- @return number
function math.deg(x) end

---  Returns the arc tangent of a `x` in radians. The result will be in the range `-pi/2` to `pi/2`. 
--- @param x number A number.
--- @return number
function math.atan(x) end

---  Returns the value `e^x^`. 
--- @param x number The exponent.
--- @return number
function math.exp(x) end

---  Returns `x^y^`. (You can also use the expression `x^y` to compute this value.) 
--- @param x number The base.
--- @param y number The exponent.
--- @return number
function math.pow(x, y) end

---  Returns the arc tangent of `y/x` (in radians), but uses the signs of both parameters to find the quadrant of the result. It also correctly handles the case of `x` being `0`.  The result will be in the interval `[-pi,+pi]` radians.  This function is useful when converting rectangular coordinates to polar coordinates. `math.atan2()` uses the sign of both arguments to place the result into the correct quadrant, and also produces correct values when one of its arguments is `0` or very close to `0`. 
--- @param y number A number representing the __y__ coordinate.
--- @param x number A number representing the __x__ coordinate.
--- @return number
function math.atan2(y, x) end

---  Returns the integer smaller than or equal to `x`. 
--- @param x number A number.
--- @return number
function math.floor(x) end

---  Returns the hyperbolic cosine of `x`. 
--- @param x number A number.
--- @return number
function math.cosh(x) end

---  Returns two numbers, the integral part of `x` and the fractional part of `x`.  For the modulus (remainder), use the modulo operator `%` instead. 
--- @param x number A number.
--- @return number
function math.modf(x) end

---  Returns `m*2^e^` where `m` containts the significant binary digits and `e` is the exponent. 
--- @param m number The significand.
--- @param e number The exponent.
--- @return number
function math.ldexp(m, e) end

---  Returns the maximum value among its arguments. 
--- @param x number A number.
--- @return number
function math.max(x) end

---  Returns the base-10 logarithm of `x`. 
--- @param x number A number.
--- @return number
function math.log10(x) end

---  Returns the natural logarithm of `x`. 
--- @param x number A number.
--- @return number
function math.log(x) end

---  Returns the arc sine of a `x` (in radians). The result will be in the range `-pi/2` to `pi/2`. If the parameter `x` is outside the range `[-1..1]`, the result will be `NaN`. 
--- @param x number A number.
--- @return number
function math.asin(x) end

---  Returns a pseudo-random number from a sequence with uniform distribution.  This function is an interface to the simple pseudo-random generator function `rand` provided by ANSI C. No guarantees can be given for its statistical properties.  There are three usage options for this function:  1. When called without arguments, returns a uniform <nobr>pseudo-random</nobr> real number in the range `[0,1]`.  2. When called with an integer number `m`, `math.random` returns a uniform <nobr>pseudo-random</nobr> integer in the range `[1,m]`. 3. When called with two integer numbers `m` and `n`, `math.random` returns a uniform <nobr>pseudo-random</nobr> integer in the range `[m,n]`.  <div class="guide-notebox"> <div class="notebox-title">Note</div>  The random number generator needs to be started with a seed using [math.randomseed()][api.library.math.randomseed] before this function is called or else it will generate the same sequence every time.  While this is useful for testing, it is more usual to get a different random sequence each run by using a different seed <nobr>(such as the current time)</nobr>.  </div>  
--- @param m number? A number.
--- @param n number? A number.
--- @return number
function math.random(m, n) end

---  Returns the cosine of `x` (the angle in radians). The result is a number in the range `[-1, 1]`. 
--- @param x number The angle in radians.
--- @return number
function math.cos(x) end

---  Returns the absolute value (magnitude) of `x`. 
--- @param x number A number.
--- @return number
function math.abs(x) end

---  Splits `x` into a normalized fraction and an exponent.  Returns two numbers:  * `m` &mdash; a number that contains the significant (binary) digits and whose absolute value is in the range `[0.5, 1.0]` (or `0` when `x` is `0`) * `e` &mdash; an integral exponent of `2`  Such that:      x = m * 2^e^  
--- @param x number A number.
--- @return number
function math.frexp(x) end

---  Returns the remainder of the division of `x` by `y` that rounds the quotient towards zero.  The remainder of a division operation is the result of subtracting the integral quotient multiplied by the denominator from the numerator:  `remainder = numerator - quotient * denominator` 
--- @param x number The numerator of the quotient.
--- @param y number The denominator of the quotient.
--- @return number
function math.fmod(x, y) end

