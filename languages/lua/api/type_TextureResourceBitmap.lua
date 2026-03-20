---@meta

---The object created by [graphics.newTexture()][api.library.graphics.newTexture]when the specified [type][api.type.TextureResource.type] is `"image"`.
---@class TextureResourceBitmap: TextureResource
---@field wrapY string
---@field wrapX string
local TextureResourceBitmap = {}

---  When an image texture is created, the bitmap is read from the file system and loaded into memory. At the first point a display object is created which utilizes the texture, it is scheduled to load to the GPU.  Use this method to schedule loading of the texture to the GPU before the start of the next time step. This may reduce the time required to render the display object which utilizes the texture.  
