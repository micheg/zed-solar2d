---@meta

---Lua arrays are just Lua [tables][api.type.Table] except they contain only numerical indices and the indices are consecutive starting at 1. When inserting or removing values from Lua arrays, you should use the [table.insert()][api.library.table.insert] and [table.remove()][api.library.table.remove] library functions.
---@class Array
local Array = {}

