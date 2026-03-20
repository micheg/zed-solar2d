---@meta

---The (globals) section covers basic functions of [Lua 5.1](https://www.lua.org/) which is the underlying programming language of CORONA_CORE_PRODUCT. All of the functions and objects listed below can be called as is (without&nbsp;a&nbsp;prefix). For example:``````luaglobals.rawget()  -- incorrect; will produce an errorrawget()          -- correct``````
---@class global
global = {}

---  Performs an equality (`==`) check between two values without invoking a metamethod. Returns a [Boolean][api.type.Boolean].  
--- @param value1 number _[Numbers][api.type.Number] or [Strings][api.type.String]._ Two values to be compared.
--- @param value2 number _[Numbers][api.type.Number] or [Strings][api.type.String]._ Two values to be compared.
--- @return boolean
function rawequal(value1, value2) end

---  This function returns three values: an iteration [Function][api.type.Function], a [Table][api.type.Table], and `0`. For example, the following construction will iterate over the pairs `(1,t[1])`, `(2,t[2])`, `...`, up to the first integer key absent from the table.  ``````lua for i,v in ipairs( t ) do 	--code end ``````  
--- @param t table The table that is to be iterated.
function ipairs(t) end

---  If index is a number, `select()` returns all arguments after argument number index. Otherwise, index must be the string `#`, and `select()` returns the total number of extra arguments it received. 
--- @param index number _[Number][api.type.Number] or [String][api.type.String]._ This parameter can either be a number, in which case `select()` returns all arguments after argument number index. Otherwise, index must be the string `#`, and `select()` returns the total number of extra arguments it received.
function select(index) end

---  Gets the real value of `table[index]`, without invoking any metamethod. `table` must be a [Table][api.type.Table]; `index` may be any [Number][api.type.Number] or [String][api.type.String].  
--- @param table table Any table.
--- @param indexG2 number _[Number][api.type.Number] or [String][api.type.String]._ Index into table (that you want to "get" the real value of).
function rawget(table, indexG2) end

---  Returns three values: the next [function][api.type.Function], a [table][api.type.Table], or `nil`. So, the following construction will iterate over all key-value pairs of [table][api.type.Table] `t`.  ``````lua for k,v in pairs( t ) do  end ``````  See function [next()][api.library.global.next] for the caveats of modifying the table during its traversal.  
--- @param t table The table you want to iterate over for the key-value pairs.
function pairs(t) end

---  Issues an error and aborts the program when the value of its first argument is `false` <nobr>(`nil` or `false`)</nobr>. Otherwise, it returns all its arguments.  This function is useful for catching (and&nbsp;avoiding) unexpected situations and bugs.  
--- @param v any _Any._ Issues an error when this value is false.
--- @param message string? An error message. When absent, it defaults to "assertion&nbsp;failed!". The error message is displayed in the Corona Simulator Console.
function assert(v, message) end

---  Returns the elements from the given table. This function is equivalent to the following:      return list[i], list[i+1], ..., list[j]  The difference is that the above code can be written only for a fixed number of elements. By default, `i` is `1` and `j` is the length of the list, as defined by the length operator (`#`). 
--- @param list table The table whose elements will be unpacked.
--- @param i number? The index of the table element at which the function will begin unpacking values. Default is `1`.
--- @param j number? The index of the table element at which the function will stop unpacking values. Default is the length of the given table provided by the length operator (`#`).
function unpack(list, i, j) end

---  Allows a program to traverse all fields of an [Array][api.type.Array]. `next()` returns the next index of the array and its associated value. When called with `nil` as its second argument, `next()` returns an initial index and its associated value. When called with the last index, or with `nil` in an empty array, `next()` returns `nil`. If the second argument is absent, then it is interpreted as `nil`. In particular, you can use `next(t)` to check whether an array is empty.  The order in which the indices are enumerated is not specified, even for numeric indices. To traverse an array in numeric order, use a numerical `for` loop or the [ipairs()][api.library.global.ipairs] function.  The behavior of `next()` is undefined if, during the traversal, you assign any value to a <nobr>non-existent</nobr> field in the array. You may, however, modify or clear existing fields.  
--- @param array Array The array that is being iterated.
--- @param index number? An index number of [Array][api.type.Array].
function next(array, index) end

---  Terminates the last protected function called (see: [pcall()][api.library.global.pcall]) and returns the first argument as the error message.  Usually, `error()` adds some information about the error position at the beginning of the message. 
--- @param message string The message to be returned with the error.
--- @param level number? Specifies how to get the error position. With Level `1` (the default), the error position is where the error function was called. Level `2` points the error to where the function that called error was called; and so on. Passing a level `0` avoids the addition of error position information to the message.
--- @return string
function error(message, level) end

---  Returns the type of its argument. Possible results are:  * `"nil"` (a string, not a `nil` value) * `"number"` * `"string"` * `"boolean"` * `"table"` * `"function"` * `"thread"` * `"userdata"` 
--- @param v any The item whose type is to be determined.
--- @return string
function type(v) end

---  Gets the metatable of a specified [Table][api.type.Table]. If the table does not have a metatable, it returns `nil`. Otherwise, if the object's metatable has a `__metatable` field, it returns the associated value. Otherwise, it returns the metatable of the given table.  
--- @param object table A table for which to get the metatable.
--- @return table
function getmetatable(object) end

---  Receives any number of arguments and prints their values to `stdout` in the Corona&nbsp;Simulator&nbsp;Console, Xcode, ADB, etc. `print()` is not intended for formatted output, but rather as a quick way to show a value, typically for debugging. For formatted output, use [string.format][api.library.string.format].  
--- @param ... number? _[Number][api.type.Number] or [String][api.type.String]._ The text to output to `stdout` (generally the Corona Simulator Console). This function will append a newline character (`\n`) to the end of the final output string.
function print(...) end

---  This API is a useful debug tool for displaying or concatenating `nil` values. For complete control of how numbers are converted to strings, use [string.format()][api.library.string.format]. 
--- @param e any _Any._ Item to convert to a string type. If the metatable of `e` has a `__tostring` field, this function calls the corresponding value with `e` as the argument and passes the result of the call as its result.
--- @return string
function tostring(e) end

---  Tries to convert its argument to a number. If the argument is already a number or a string that can be converted to a number, `tonumber()` returns the number, otherwise, it returns `nil`.  An optional argument (`base`) specifies the base to interpret the numeral. 
--- @param e any The item to be converted to a number.
--- @param base number? Specifies the base to interpret the numeral. The base may be any integer between `2` and `36`, inclusive. In bases above 10, the letter `A` (in either uppercase or lowercase) represents `10`, `B` represents `11`, and so forth, with `Z` representing `35`. In base 10 (default), the number can have a decimal part as well as an optional exponent part. In other bases, only unsigned integers are accepted.
--- @return number
function tonumber(e, base) end

---  Sets the metatable for the given table (you cannot change the metatable of other types from Lua, only from C). If `metatable` is `nil`, removes the metatable of the given table. If the original metatable has a `__metatable` field, it raises an error.  This function returns the same table that was provided as the first argument of the function, now with its metatable set. 
--- @param table table The Lua table whose metatable you want to modify.
--- @param metatable table The Lua table to set as the new metatable for `table`.
--- @return table
function setmetatable(table, metatable) end

---  Returns the current environment in use by a specified [Function][api.type.Function]. The first argument can be a [Function][api.type.Function] or a [Number][api.type.Number] that specifies the function at that stack level: level `1` is the function calling `getfenv()`. If the given function is not a Lua function, or if `f` is `0`, `getfenv()` returns the global environment. The default for `f` is `1`. 
--- @param f function? _[Function][api.type.Function] or [Number][api.type.Number]._ Specifies the function at that stack level.
function getfenv(f) end

---  A generic interface to Lua's garbage collector. Using this function is not required because Lua has automatic garbage collection features. 
--- @param opt string Performs garbage collection functions differently based on this option. Acceptable values include:* `"collect"` &mdash; performs a full garbage-collection cycle. This is the default option.* `"stop"` &mdash; stops the garbage collector.* `"restart"` &mdash; restarts the garbage collector.* `"count"` &mdash; returns the total memory in use by Lua (in kilobytes).* `"step"` &mdash; performs a garbage-collection step. The step "size" is controlled by `arg` (larger values mean more steps) in a non-specified way. If you want to control the step size you must experimentally tune the value of `arg`. Returns `true` if the step finished a collection cycle.* `"setpause"` &mdash; sets `arg` as the new value for the pause of the collector. Returns the previous value for pause.* `"setstepmul"` &mdash; sets `arg` as the new value for the step multiplier of the collector. Returns the previous value for step.
--- @param arg any? _Any._ Arguments that are directly related to the value you chose for `opt`. Many options do not need arguments to be passed.
function collectgarbage(opt, arg) end

---  Calls a function specified as the first argument, with the given arguments (as the following arguments) in protected mode. This means that any error inside `f` is not propagated; instead, `pcall()` catches the error and returns a status code. Its first result is the status code (a [Boolean][api.type.Boolean]), which is `true` if the call succeeds without errors. In such case, `pcall()` also returns all results from the call, after this first result. In case of any error, `pcall()` returns `false` plus the error message. 
--- @param f function The function to be called in protected mode.
--- @param ... any? _Any._ Can be anywhere from zero to any amount of arguments to be passed to the function to be called.
--- @return boolean
function pcall(f, ...) end

---  Sets the real value of `table[index]` to `value` without invoking any metamethod. `table` must be a table, `index` any value different from `nil`, and `value` any Lua value. 
--- @param table table Table to modify.
--- @param index number _[Number][api.type.Number] or [String][api.type.String]._ Index into table.
--- @param value any The value to be written to `table[index]`.
--- @return table
function rawset(table, index, value) end

---  Sets the environment &mdash; or the table where Lua keeps all its global variables &mdash; to be used by the given function.  This function returns the same function that is passed as the first argument. 
--- @param f function _[Function][api.type.Function] or [Number][api.type.Number]._ If `f` is a function, `setfenv()` sets the environment for that function. If a number is specified, the environment for the function at that stack level is set. Number `1` means the current function, number `2` means the function calling the current function, and so on. As a special case, when set to `0`, `setfenv()` changes the environment of the running thread, in which case nothing is returned.
--- @param table table The table containing the new environment.
--- @return function
function setfenv(f, table) end

