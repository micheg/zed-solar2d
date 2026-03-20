---@meta

---Standard Lua library to create, write, and read files.Applications running on a device are "sandboxed", meaning your files (application images, data, preferences, etc.) are stored in a location that no other application can access. Your files will reside in an <nobr>app-specific</nobr> directory for documents, resources, or temporary files. The `io` library functions allow you to manage these resources.For more information, see the [Reading and Writing Files][guide.data.readWriteFiles] guide.
---@class io
io = {}

---  Reads the file set by [io.input()][api.library.io.input], according to the given formats which specify what to read. For each format, the function returns a [string][api.type.String] or a [number][api.type.Number] with the characters read, or `nil` if it cannot read data with the specified format. When called without formats, it uses a default format that reads the entire next line (`"*l"`).  If you are reading data from a file, `file:read()` should be used instead of `io.read()`. 
--- @param fmt1 string? _[String][api.type.String] or [Number][api.type.Number]._ Determines the type/amount of data to read. The available formats are:* `"*l"` &mdash; Reads the next line (skipping the end of line), returning `nil` on end of file (EOF). This is the __default__ format.* `"*n"` &mdash; Reads a [number][api.type.Number]; this is the only format that returns a [number][api.type.Number] instead of a [string][api.type.String].* `"*a"` &mdash; Reads the whole file, starting at the current position. On end of file, it returns the empty string.* [Number][api.type.Number] &mdash; Reads up to this number of characters, returning `nil` on end of file. If this number is `0`, it reads nothing and returns an empty string, or `nil` on end of file.
--- @param fmt2 string? _[String][api.type.String] or [Number][api.type.Number]._ Determines the type/amount of data to read. The available formats are:* `"*l"` &mdash; Reads the next line (skipping the end of line), returning `nil` on end of file (EOF). This is the __default__ format.* `"*n"` &mdash; Reads a [number][api.type.Number]; this is the only format that returns a [number][api.type.Number] instead of a [string][api.type.String].* `"*a"` &mdash; Reads the whole file, starting at the current position. On end of file, it returns the empty string.* [Number][api.type.Number] &mdash; Reads up to this number of characters, returning `nil` on end of file. If this number is `0`, it reads nothing and returns an empty string, or `nil` on end of file.
--- @param ... string? _[String][api.type.String] or [Number][api.type.Number]._ Determines the type/amount of data to read. The available formats are:* `"*l"` &mdash; Reads the next line (skipping the end of line), returning `nil` on end of file (EOF). This is the __default__ format.* `"*n"` &mdash; Reads a [number][api.type.Number]; this is the only format that returns a [number][api.type.Number] instead of a [string][api.type.String].* `"*a"` &mdash; Reads the whole file, starting at the current position. On end of file, it returns the empty string.* [Number][api.type.Number] &mdash; Reads up to this number of characters, returning `nil` on end of file. If this number is `0`, it reads nothing and returns an empty string, or `nil` on end of file.
--- @return string
function io.read(fmt1, fmt2, ...) end

---  Opens the given file name in read mode and returns an iterator function that, each time it is called, returns a new line from the file.  The function will open the file and iterate over all lines of the file. When the iterator function detects the end of file, it returns `nil` <nobr>(to finish the loop)</nobr> and automatically closes the file.  The call `io.lines()` with no file is similar to `io.input():lines()`; that is, it iterates over the lines of the default input file, except it does not close the file when the loop ends.  This function returns an iterator function that, each time it is called, returns a new line from the file.  
--- @param file table File to read. You must use [system.pathForFile()][api.library.system.pathForFile] to create a file name and path to the `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory`, or `system.CachesDirectory` [constants][api.type.Constant].
--- @return function
function io.lines(file) end

---  Flushes the default output file. Equivalent to `io.output():flush`.  If [io.output][api.library.io.output] has not been changed from its default output (`stdout`), this will flush any [io.write](api.library.io.write) or print data to the Corona Simulator Console, Xcode console, or `Console.app`. 
function io.flush() end

---  Sets the standard output file. When called with a file name, it opens the named file in text mode and sets its handle as the default output file. When called with a file handle, it simply sets this file handle as the default output file. When called without parameters, it returns the current default output file.  The default output is `stdout` which is the Corona Simulator Console. This is similar behavior to [io.input()][api.library.io.input] but operates over the default output file.  This function returns a file handle of the just-opened file or the handle to the current input file handle. 
--- @param file string? _[String][api.type.String] or [Object][api.type.Object]._ File name or file handle.
--- @return table
function io.output(file) end

---  Writes the value of each of its arguments to the file. The arguments must be strings or numbers. To write other values, use [tostring()][api.library.global.tostring] or [string.format()][api.library.string.format] before writing.  In the normal mode, this function writes to the standard output (`stdout`) which defaults to the Corona Simulator Console if [io.output()][api.library.io.output] has not been called with a file name. This is equivalent to `io.output():write`. In short, it's similar to `print()`, but no newline character (`\n`) is appended to the output string.  If you intend to write data to a file, `file:write()` should be used instead of `io.write()`.  For security reasons, you are not allowed to write files in the `system.ResourceDirectory` (the directory where the application is stored). You must specify the `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory`, or `system.cachesDirectory` parameter in the [system.pathForFile()][api.library.system.pathForFile] function when opening the file for writing. See [io.open()][api.library.io.open] for details. 
--- @param arg1 string? _[String][api.type.String] or [Number][api.type.Number]._ One or more string or number arguments (separate by commas).<!--- This no longer works with the Corona Simulator Console
--- @param arg2 string? _[String][api.type.String] or [Number][api.type.Number]._ One or more string or number arguments (separate by commas).<!--- This no longer works with the Corona Simulator Console
--- @param ... string? _[String][api.type.String] or [Number][api.type.Number]._ One or more string or number arguments (separate by commas).<!--- This no longer works with the Corona Simulator Console
function io.write(arg1, arg2, ...) end

---  Opens a temporary file for reading and writing and returns a handle to it. When the app ends normally, this file will be deleted.  Note that calling this function creates an empty file. Use the `file:seek()` function to reset the position in the file for reading back the data. The data will be lost if you close and call `io.tmpfile()` to open it again. 
--- @return table
function io.tmpfile() end

---  Checks whether `obj` is a valid file handle. Returns the string `"file"` if `obj` is an open file handle, `"closed file"` if `obj` is a closed file handle, or `nil` if `obj` is not a file handle. 
--- @param obj table Object to be tested.
--- @return string
function io.type(obj) end

---  Closes an open file handle. Equivalent to `file:close()`. If a file handle is not specified, this function closes the default output file. 
--- @param file table? Handle of file (as returned from [io.open][api.library.io.open]) to be closed.
function io.close(file) end

---  This function opens a file for reading or writing, in the string (default) or binary mode. It returns a new file handle or, in case of errors, `nil` plus an error message. This function can also be used to create a new file.  
--- @param file table File to open. You must use [system.pathForFile()][api.library.system.pathForFile] to create a file name and path to the `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory`, or `system.CachesDirectory` [constants][api.type.Constant].
--- @param mode string? Determines which file mode to open the file in. The mode string can be any of the following:* `"r"` &mdash; Read mode (the default); the file pointer is placed at the beginning of the file.* `"w"` &mdash; Write-only mode; overwrites the file if the file exists. If the file does not exist, creates a new file for writing.* `"a"` &mdash; Append mode (write only); the file pointer is at the end of the file if the file exists (the file is in the append mode). If the file does not exist, it creates a new file for writing.* `"r+"` &mdash; Update mode (read/write); all previous data is preserved. The file pointer will be at the beginning of the file. If the file exists, it will only be overwritten if you explicitly write to it.* `"w+"` &mdash; Update mode (read/write); all previous data is erased. Overwrites the existing file if the file exists. If the file does not exist, creates a new file for reading and writing.* `"a+"` &mdash; Append update mode (read/write); previous data is preserved and writing is only allowed at the end of file. The file pointer is at the end of the file if the file exists (the file opens in the append mode). If the file does not exist, it creates a new file for reading and writing.The mode string can also have a `'b'` at the end, which is needed in some systems to open the file in binary mode. This string is exactly what is used in the standard C function fopen.
--- @return table
function io.open(file, mode) end

---  Sets the standard input file. When called with a file handle, it simply sets this file handle as the default input file. When called without parameters, it returns the current default input file.  This function returns a file handle of the opened file or the handle to the current input file.  
--- @param file table? File to set as the standard input file. You must use [system.pathForFile()][api.library.system.pathForFile] to create a file name and path to the `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory`, or `system.CachesDirectory` [constants][api.type.Constant].
--- @return table
function io.input(file) end

