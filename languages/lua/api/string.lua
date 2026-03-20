---@meta

---This library provides generic functions for string manipulation, such as finding and extracting substrings, and pattern matching. This uses the standard Lua 5.1 library.For more information, see the [Lua String Manipulation][guide.data.luaString] guide.
---@class string
string = {}

---  Extract substrings by matching a pattern in a string. If a match is found, returns the captures from the pattern; otherwise returns `nil`. If pattern specifies no captures, then the whole match is returned.  
--- @param s string Any string.
--- @param pattern string Specifies the pattern to match. See [Lua String Manipulation][guide.data.luaString].
--- @param init number? Number specifying where in `s` to start the search. The default is `1`; can be negative.
--- @return string
function string.match(s, pattern, init) end

---  Replaces all occurrences of a pattern in a string. Returns the string after the substitutions have been performed, along with the number of substitutions made <nobr>(`0` if none)</nobr>. 
--- @param s string The string to be searched.
--- @param pattern string A string specifying the pattern to match. See [Lua String Manipulation][guide.data.luaString].
--- @param repl string _[String][api.type.String], [Table][api.type.Table], or [Function][api.type.Function]._ Depending on the type, `string.gsub()` works as follows:* If `repl` is a string, its value is used for the replacement. The character `%` works as an escape character: any sequence in `repl` of the form `%n`, with `n` between `1` and `9`, stands for the value of the <nobr>`n`th</nobr> captured substring. The sequence `%0` stands for the whole match and the sequence `%%` stands for a single `%`.* If `repl` is a table, the table is queried for every match, using the first capture as the key; if the pattern specifies no captures, the whole match is used as the key.* If `repl` is a function, this function is called every time a match occurs, with all captured substrings passed as arguments in order; if the pattern specifies no captures, the whole match is passed as a sole argument.* If the value returned by the table query or by the function call is a string or a number, it is used as the replacement string; otherwise, if it is `false` or `nil`, then there is no replacement (the&nbsp;original match is kept in the&nbsp;string).
--- @param n number? Number of occurrences of pattern to replace.
--- @return string
function string.gsub(s, pattern, repl, n) end

---  Looks for the first match of a pattern in a string. If found, it returns the indices where the occurrence starts and ends; otherwise, returns `nil`. 
--- @param s string The string.
--- @param pattern string Specifies the pattern to match. See [Lua String Manipulation][guide.data.luaString].
--- @param init number? Specifies where to start the search. Default value is `1` and can be negative. Negative numbers start at the end of the string.
--- @param plain boolean? A value of `true` turns off the pattern matching facilities, so the function does a plain "find substring" operation with no characters in pattern being considered "magic". If `plain` is given, then the `init` argument must be provided as well.
--- @return number
function string.find(s, pattern, init, plain) end

---  Returns a formatted string following the description given in its arguments.  For more information, see the `string.format()` section [here](http://lua-users.org/wiki/StringLibraryTutorial). 
--- @param formatstring string The string.
--- @param ... string? Optional additional parameters that follow the same rules as the `printf` family of standard C functions. The only differences are that the options/modifiers `*`, `l`, `L`, `n`, `p`, and `h` are not supported and that there is an extra option, `q`. The `q` option formats a string in a form suitable to be safely read back by the Lua interpreter: the string is written between double quotes, and all double quotes, newlines, embedded zeros, and backslashes in the string are correctly escaped when written. The options `c`, `d`, `E`, `e`, `f`, `g`, `G`, `i`, `o`, `u`, `X`, and `x` all expect a number as argument, whereas `q` and `s` expect a string. `string.format()` does not accept string values containing embedded zeros, except as arguments to the `q` option.
--- @return string
function string.format(formatstring, ...) end

---  Returns a string in which each character has the internal numerical code equal to its corresponding argument.  Note that the numerical codes are not necessarily portable across platforms.  
--- @param arg1 number? Zero or more integers (whole numbers).
--- @return string
function string.char(arg1) end

---  Returns a substring (a specified portion of an existing string). 
--- @param s string The string.
--- @param i number Index of the start of the substring (character position).
--- @param j number? Index of the end of the substring (inclusive). If not specified, the substring ends at the end of the string.
--- @return string
function string.sub(s, i, j) end

---  Reverses a string. 
--- @param s string The string to reverse.
--- @return string
function string.reverse(s) end

---  Change uppercase characters in a string to lowercase.  Note that the definition of uppercase depends on the current locale. 
--- @param s string Any string.
--- @return string
function string.lower(s) end

---  Returns the internal numerical codes of the characters in a string.  
--- @param s string The string.
--- @param i number? Specify the characters of the string `s[i], s[i+1], ..., s[j]` for which to get the codes. The default value for `i` is `1`; the default value for `j` is `i`.
--- @param j number? Specify the characters of the string `s[i], s[i+1], ..., s[j]` for which to get the codes. The default value for `i` is `1`; the default value for `j` is `i`.
--- @return number
function string.byte(s, i, j) end

---  Returns a [boolean][api.type.Boolean] `true` or `false` depending on whether a given string starts with the specified `prefix` characters.  
--- @param s string The string to be checked.
--- @param prefix string A string indicating the prefix to check against.
--- @return boolean
function string.starts(s, prefix) end

---  Replicates a string by returning a string that is the concatenation of `n` copies of a specified [String][api.type.String]. 
--- @param s string The string to replicate.
--- @param n number Amount of times to replicate the string.
--- @return string
function string.rep(s, n) end

---  Returns the length of a string (amount of characters). 
--- @param s string Any string.
--- @return number
function string.len(s) end

---  Returns a pattern-finding iterator. See [Lua String Manipulation][guide.data.luaString] for more information.  
--- @param s string The string to be searched.
--- @param pattern string A string specifying the pattern to match. See [Lua String Manipulation][guide.data.luaString] for more information.
function string.gmatch(s, pattern) end

---  Change lowercase characters in a string to uppercase. All other characters are left unchanged.  
--- @param s string The string.
--- @return string
function string.upper(s) end

---  Returns a [boolean][api.type.Boolean] `true` or `false` depending on whether a given string ends with the specified `suffix` characters.  
--- @param s string The string to be checked.
--- @param suffix string A string indicating the suffix to check against.
--- @return boolean
function string.ends(s, suffix) end

