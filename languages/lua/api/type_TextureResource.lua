---@meta

---The base class for all textures created by [graphics.newTexture()][api.library.graphics.newTexture]. Objects of this type provide a handle to manually manage and access information about textures.
---@class TextureResource
---@field baseDir Constant
---@field type string
---@field filename string
local TextureResource = {}

---  The [graphics.newTexture()][api.library.graphics.newTexture] API <nobr>pre-loads</nobr> a texture/image and prevents it from being disposed even when there is no display object using it. In order to release the [TextureResource][api.type.TextureResource] object and restore automatic management for the texture, you must release it by calling `texture:releaseSelf()`.  Alternatively, in a wider scope, [graphics.releaseTextures()][api.library.graphics.releaseTextures] can be used to release all texture objects sharing the same [type][api.type.TextureResource.type] parameter.  
