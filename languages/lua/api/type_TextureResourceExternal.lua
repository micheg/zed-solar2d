---@meta

---The object created by various plugins, with a [type][api.type.TextureResource.type] property of `"external"`.
---@class TextureResourceExternal: TextureResource
---@field height number
---@field width number
local TextureResourceExternal = {}

---  Calling this function will update the texture from the source provided by a plugin.  
---@param self any
function TextureResourceExternal.invalidate(self) end

