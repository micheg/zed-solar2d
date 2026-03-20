---@meta

---This standard Lua library provides functions for dealing with system time and date and other OS-related functions.
---@class os
os = {}

---  Returns the current time in seconds from 1970 when called without arguments, or a time representing the date and time specified by the given table. 
--- @param table table? table specifying a time to convert to seconds. If `table` is present, it must have fields `year`, `month`, and `day`, and may have additional fields `hour`, `min`, `sec`, and `isdst` (for a description of these fields, see the [os.date][api.library.os.date] function).
--- @return number
function os.time(table) end

---  Renames a file or directory and returns two possible values:  * `result` &mdash; `true` if the file was renamed or `nil` if the file was not found. * `reason` &mdash; `nil` if rename was successful, otherwise a [string][api.type.String] describing the reason for failure. 
--- @param oldname string Old file name.
--- @param newname string New file name.
--- @return boolean
function os.rename(oldname, newname) end

---  Deletes a file or directory and returns two possible values:  * `result` &mdash; `true` if the file was successfully removed, otherwise `false`. * `reason` &mdash; `nil` if remove was successful, otherwise a [string][api.type.String] describing the reason for failure. 
--- @param file string String specifying the name of the file or directory to remove.
--- @return string
function os.remove(file) end

---  Passes a string to the operating system for execution and returns a system-dependent status code. This function is equivalent to the C function `system()`.   This function returns a [number][api.type.Number] representing the status code with the system-dependent results of the command.  
--- @param cmd string String specifying a command to be executed by an operating system shell. The function of this command depends on what is allowed by the running OS. If `cmd` is not specified, the return value is <nobr>non-zero</nobr> if a shell is available, or zero otherwise.
--- @return number
function os.execute(cmd) end

---  Returns an approximation of the amount in seconds of CPU time used by the program.  This is a standard Lua function that returns the CPU in seconds. A run time of 5 seconds returns as 0.05. It counts from 0.00 to 0.99 before rolling over to 1.00. 
--- @return number
function os.clock() end

---  Returns a string or a table containing date and time, formatted according to the given string format. When called without arguments, `os.date()` returns a reasonable date and time representation that depends on the host system and on the current locale (that&nbsp;is, `os.date()` is equivalent to `os.date("%c")`). 
--- @param format string? If format starts with `!`, the date is formatted in Coordinated Universal Time. After this optional character, if format is the string `*t`, then date returns a table with the following fields: * `year` (four&nbsp;digits)* `month` (1-12)* `day` (1-31)* `hour` (0-23)* `min` (0-59)* `sec` (0-61)* `wday` <nobr>(weekday; Sunday is 1)</nobr>* `yday` <nobr>(day of the year)</nobr>* `isdst` (daylight&nbsp;saving flag, a&nbsp;boolean). If format is not `*t`, then `os.date()` returns the date as a string, formatted according to similar rules as the C function `strftime(3)`.<div class="inner-table">Code		Purpose----------- ---------------------------------------------------------------------------`%a`        Abbreviated weekday name`%A`        Full weekday name `%b`        Abbreviated month name `%B`        Full month name `%c`        Date and time representation appropriate for locale `%d`        Day of month as decimal number (01 – 31) `%H`        Hour in 24-hour format (00 – 23) `%I`        Hour in 12-hour format (01 – 12) `%j`        Day of year as decimal number (001 – 366) `%m`        Month as decimal number (01 – 12) `%M`        Minute as decimal number (00 – 59) `%p`        Current locale's A.M./P.M. indicator for 12-hour clock `%S`        Second as decimal number (00 – 59) `%U`        Week of year as decimal number, with Sunday as first day of week (00 – 53) `%w`        Weekday as decimal number (0 – 6; Sunday is 0) `%W`        Week of year as decimal number, with Monday as first day of week (00 – 53) `%x`        Date representation for current locale `%X`        Time representation for current locale `%y`        Year without century, as decimal number (00 – 99) `%Y`        Year with century, as decimal number `%z`, `%Z`  The time-zone name or time zone abbreviation `%%`        Percent sign----------- ---------------------------------------------------------------------------</div>Note that this list is somewhat dependent on the operating system, so don't rely on any additional format items when working on all platforms.
--- @param time number? If the `time` argument is present, this is the time to be formatted (see&nbsp;the [os.time()][api.library.os.time] function for a description of this&nbsp;value). Otherwise, `os.date()` formats the current time.
--- @return string
function os.date(format, time) end

---  Returns the number of seconds from time `t1` to time `t2`. In POSIX, Windows, and some other systems, this value is exactly <nobr>`t2 - t1`</nobr>. 
--- @param newerTime number First time parameter.
--- @param olderTime number Second time parameter.
--- @return number
function os.difftime(newerTime, olderTime) end

---  <div class="guide-notebox-imp"> <div class="notebox-title-imp">Important</div> This is a low level Lua call that should __not__ be used on any platform.  Use [native.requestExit()][api.library.native.requestExit] instead (other than on iOS which does not permit apps to terminate themselves). </div>  Calls the C function `exit()`, with an optional code, to terminate the host program. The default value for code is the success code. 
--- @param exit number? Optional parameter that returns the exit code to the OS.
function os.exit(exit) end

