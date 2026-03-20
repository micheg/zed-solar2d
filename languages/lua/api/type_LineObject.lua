---@meta

---Line objects are created using [display.newLine()][api.library.display.newLine].
---@class LineObject: DisplayObject
---@field anchorSegments boolean
local LineObject = {}

---  Append one or more segments to an existing object created using [display.newLine()][api.library.display.newLine].  
--- @param x number One or more `[x,y]` pairs specifying a new point to extent the existing line.
--- @param y number One or more `[x,y]` pairs specifying a new point to extent the existing line.
--- @param ... number One or more `[x,y]` pairs specifying a new point to extent the existing line.
---@param self any
function LineObject.append(self, x, y, ...) end

