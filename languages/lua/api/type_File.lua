---@meta

---File objects in Corona are used to interact with (read and write) external files, and are returned from [io.open()][api.library.io.open].
---@class File: userdata
local File = {}

---  Reads a file, according to the given formats which specify what to read. For each format, the function returns a [string][api.type.String] or a [number][api.type.Number] with the characters read, or `nil` if it cannot read data with the specified format. When called without formats, it uses a default format that reads the entire next line.  
--- @param fmt1 string? _[String][api.type.String] or [Number][api.type.Number]._ The available formats are:* `"*l"` &mdash; Reads the next line (skipping the end of line), returning `nil` on end of file (EOF). This is the **default** format.* `"*n"` &mdash; Reads a [number][api.type.Number]; this is the only format that returns a [number][api.type.Number] instead of a [string][api.type.String].* `"*a"` &mdash; Reads the whole file, starting at the current position. On end of file, it returns the empty string.* [Number][api.type.Number] &mdash; Reads up to this number of characters, returning `nil` on end of file. If this number is `0`, it reads nothing and returns an empty string, or `nil` on end of file.
--- @param fmt2 string? _[String][api.type.String] or [Number][api.type.Number]._ The available formats are:* `"*l"` &mdash; Reads the next line (skipping the end of line), returning `nil` on end of file (EOF). This is the **default** format.* `"*n"` &mdash; Reads a [number][api.type.Number]; this is the only format that returns a [number][api.type.Number] instead of a [string][api.type.String].* `"*a"` &mdash; Reads the whole file, starting at the current position. On end of file, it returns the empty string.* [Number][api.type.Number] &mdash; Reads up to this number of characters, returning `nil` on end of file. If this number is `0`, it reads nothing and returns an empty string, or `nil` on end of file.
--- @param ... string? _[String][api.type.String] or [Number][api.type.Number]._ The available formats are:* `"*l"` &mdash; Reads the next line (skipping the end of line), returning `nil` on end of file (EOF). This is the **default** format.* `"*n"` &mdash; Reads a [number][api.type.Number]; this is the only format that returns a [number][api.type.Number] instead of a [string][api.type.String].* `"*a"` &mdash; Reads the whole file, starting at the current position. On end of file, it returns the empty string.* [Number][api.type.Number] &mdash; Reads up to this number of characters, returning `nil` on end of file. If this number is `0`, it reads nothing and returns an empty string, or `nil` on end of file.
--- @return string
---@param self any
function File.read(self, fmt1, fmt2, ...) end

---  Returns an iterator function that, each time it is called, returns a new line from the file.  This function is similar to [io.lines()][api.library.io.lines] except the file must be open first (with [io.open()][api.library.io.open]) and does not automatically close at the end of the file. 
--- @return function
---@param self any
function File.lines(self) end

---  Commits the file's output buffer. Saves any written data to the file. 
---@param self any
function File.flush(self) end

---  Writes the value of each of its arguments to the file. The arguments must be [Strings][api.type.String] or [Numbers][api.type.Number]. To write other values, use `tostring()` or [string.format()][api.library.string.format] before calling `File:write()`. 
--- @param arg1 string One or more strings to be written to the file represented by the `File` object.
--- @param arg2 string One or more strings to be written to the file represented by the `File` object.
--- @param ... string One or more strings to be written to the file represented by the `File` object.
---@param self any
function File.write(self, arg1, arg2, ...) end

---  Closes the open file (file is returned from [io.open()][api.library.io.open]).  Note that files are automatically closed when their handles are garbage collected, but that takes an unpredictable amount of time to happen.  
---@param self any
function File.close(self) end

---  Sets the buffering mode for an output file (or console).  This function can be used to control buffering of file writes and console output. When buffering is disabled on console output ([print()][api.library.global.print] and calls to [io.write()][api.library.io.write]), the information (debug&nbsp;data) is displayed instantly on the Xcode console and `Console.app` for iPhone/iPad. 
--- @param mode string There are three available modes:* `"no"` &mdash; No buffering; the result of any output operation appears immediately.* `"full"` &mdash; Full buffering; output operation is performed only when the buffer is full (or when you explicitly flush the file (see&nbsp;[io.flush()][api.library.io.flush])).* `"line"` &mdash; Line buffering; output is buffered until a newline is output or there is any input from some special files such as a Terminal device.
--- @param size number? Specifies the size of the buffer, in bytes. The default is an appropriate size.
---@param self any
function File.setvbuf(self, mode, size) end

---  Sets and gets the file position, measured from the beginning of the file, to the position given by offset plus a base.  The function can be used to get the current file position (`"cur"`) or `"set"` the file position to the beginning, end, or any position between.  In case of success, the function returns the file position as a [Number][api.type.Number], measured in bytes from the beginning of the file. If this function fails, it returns `nil`, plus a [String][api.type.String] describing the error. 
--- @param mode string? Can be one of the following values:* `"set"` &mdash; base is position 0 (beginning of the file)* `"cur"` &mdash; base is current position (default)* `"end"` &mdash; base is end of fileThe default value for mode is `"cur"`, and for offset is `0`. Therefore, the call `File:seek()` returns the current file position without changing it. The call `File:seek("set")` sets the position to the beginning of the file and returns `0`. The call `File:seek("end")` sets the position to the end of the file, and returns its size.
--- @param offset number? Specifies the position for the `"set"` mode. The number is `0` based (which is the beginning of the file).
--- @return number
---@param self any
function File.seek(self, mode, offset) end

