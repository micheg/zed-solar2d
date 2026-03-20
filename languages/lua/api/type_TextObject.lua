---@meta

---Text objects are created using the [display.newText()][api.library.display.newText] function.
---@class TextObject: DisplayObject
---@field text string
---@field baselineOffset number
---@field size number
local TextObject = {}

---  Sets the color parameters for an embossed text object created via [display.newEmbossedText()][api.library.display.newEmbossedText].  
--- @param colorTable table A table which must include two named sub-tables for the `highlight` and `shadow` of the embossed text object. Each of these tables should contain the RGB+A color values for the respective property.
---@param self any
function TextObject.setEmbossColor(self, colorTable) end

