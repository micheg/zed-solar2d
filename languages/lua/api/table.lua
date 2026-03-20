---@meta

---Tables in Lua implement associative arrays. That is, they can be indexed not just with numbers, but also with strings or any other value of the language, except nil.When you use tables, you should choose how to index Lua tables (either numerically or non-numerical numbers).Most functions in the `table` library assume that the table represents a (numerically-indexed) array or list. For these functions, when we talk about the "length" of a table we mean the result of the length operator.
---@class table
table = {}

---  Returns a shallow copy of array, i.e. the portion of the array (table) with integer keys. A variable number of additional arrays can be passed in as optional arguments. If an array has a hole (a `nil` entry), copying in a given source array stops at the last consecutive item prior to the hole.  In Lua, the function `table.concat()` is equivalent to JavaScript's `array.join()`. Hence, the following function is called `copy()`. 
--- @param t Array An array of elements.Additional arrays can optionally be passed.
--- @return Array
function table.copy(t) end

---  Sorts table elements in a given order, in-place, from `table[1]` to `table[n]`, where `n` is the length of the table. It receives the table (array) to be sorted plus an optional `compare` function. This `compare` function receives two arguments and must return `true` if the first argument should come first in the sorted array. If `compare` is __not__ given, then the standard Lua operator `<` is used instead.  The sort algorithm is not entirely stable; that is, elements considered equal by the given order may have their relative positions changed by the sort. 
--- @param array Array The array to sort.
--- @param compare function? If not given, the standard Lua operator `<` is used.
function table.sort(array, compare) end

---  Returns the largest positive numerical index of the given table, or zero if the table has no positive numerical indices. To do its job, this function does a linear traversal of the whole table. 
--- @param t Array The array to traverse.
--- @return number
function table.maxn(t) end

---  Concatenate the elements of a table together to form a string. Each element must be able to be coerced into a string. A separator can be specified which is placed between concatenated elements. 
--- @param t Array An array where all elements are strings or numbers.
--- @param sep string? The string to insert between concatenated table values. The default value is the empty string.
--- @param i number? . The beginning table index to be concatenated. The default value is 1.
--- @param j number? . The ending table index to be concatenated. The default value is the length of the array `t`. If i is greater than j, returns the empty string.
--- @return string
function table.concat(t, sep, i, j) end

---  Returns the integer index of an element within an array, or `nil` if the element is not in the array. The search goes through the length of the array as determined by `#t` whose value is undefined if there are holes. 
--- @param t Array The array to be searched.
--- @param element string _[String][api.type.String] or [Number][api.type.Number]._ The element to search for within array `t`.
--- @return number
function table.indexOf(t, element) end

---  Removes from table the element at position `pos`, shifting down other elements to close the space, if necessary. Returns the value of the removed element.   <div class="docs-tip-outer docs-tip-color-alert"> <div class="docs-tip-inner-left"> <div class="fa fa-exclamation-circle" style="font-size: 35px;"></div> </div> <div class="docs-tip-inner-right">  `table.remove()` may affect performance because it has to shuffle all of the elements in the array (following&nbsp;the one being&nbsp;removed) down by one. Thus, it should not be used in <nobr>time-critical</nobr> sections of code.  </div> </div>  
--- @param t table The table from which to remove.
--- @param pos number? Position of the element to remove. Its default value is the length of the table, so `table.remove(t)` removes the last element of `t`.
function table.remove(t, pos) end

---  Inserts a given value into a table. If a position is given, inserts the value before the element currently at that position. 
--- @param t table A table to which the new value will be added. When a table has an element inserted both the size of the array and the element indices are updated.
--- @param pos number? The index of the table at which the new element will be inserted. The default value is the length of the table + 1 so that `table.insert(t,x)` inserts `x` at the end of table `t`.
--- @param value any The new value to assign to be inserted into the table.
---@overload fun (t:table, value:any)
function table.insert(t, pos, value) end

