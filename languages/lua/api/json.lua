---@meta

---The `json` library allows you to serialize and deserialize Lua tables into JSON ([JavaScript Object Notation](https://www.json.org/json-en.html)). You often use <nobr>JSON-formatted</nobr> data in conjunction with web APIs, for example requests sent using the [facebook][api.library.facebook] library.
---@class json
local json = {}

---  Returns a string which is a human readable representation of the given object (or valid JSON string). The string is indented and the top-level keys are sorted into alphabetical order suitable for displaying on the console with `print()`. 
--- @param obj string Lua table or string containing JSON data.
--- @return string
function json.prettify(obj) end

---  Decodes the JSON-encoded data structure and returns a Lua object ([table][api.type.Table]) with the data. The return value is a Lua object when the data is successfully decoded or, in the case of an error, three values: `nil`, the position of the next character that doesn't belong to the object, and an error message. 
--- @param data string String containing JSON data.
--- @param position number? Index within `data` to start decoding (default is `1` if omitted).
--- @param nullval any? Value to be returned for items with a value of `json.null` (see [json.encode()][api.library.json.encode]). This is useful if your data contains items which are "null" but you need to know of their existence (in Lua, table items with values of `nil` don't normally exist).
--- @return table
function json.decode(data, position, nullval) end

---  Decodes the contents of a file that is expected to contain <nobr>JSON-encoded</nobr> data and returns a Lua object ([table][api.type.Table]) with the appropriate data. The return value is a Lua object when the data is successfully decoded or, in the case of an error, three values: `nil`, the position of the next character that doesn't belong to the object, and an error message. Errors can either relate to issues opening the file or to JSON syntax issues. 
--- @param filename string String containing the name of a file containing JSON data.
--- @param position number? Index within file to start decoding (default is `1` if omitted).
--- @param nullval any? Value to be returned for items with a value of `json.null` <nobr>(see [json.encode()][api.library.json.encode])</nobr>. This is useful if your data contains items which are "null" but you need to know of their existence (in&nbsp;Lua,&nbsp;table items with values of `nil` don't normally&nbsp;exist).
--- @return table
function json.decodeFile(filename, position, nullval) end

---  Returns the Lua object (table) as a JSON-encoded string. Since items with `nil` values in a Lua table effectively don't exist, you should use `json.null` as a placeholder value if you need to preserve array indices in your JSON (see discussion of `nullval` in [json.decode()][api.library.json.decode]).  
--- @param t table Lua table.
--- @param options table? Lua table containing optional directives to the JSON library: * `indent` &mdash; set to `true` to produce formatted JSON output. * `exception` &mdash; function called to handle unsupported datatypes. Parameters are `reason`, `value`, `state` and `defaultmessage`. Return a string to be included in the output or `nil` to raise an error. By default, Corona handles unsupported values as strings.
--- @return string
function json.encode(t, options) end

return json
