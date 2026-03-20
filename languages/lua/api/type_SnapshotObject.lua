---@meta

---Snapshot objects let you capture a group of display objects and render them into a flattened image. 
---@class SnapshotObject: DisplayObject
---@field group GroupObject
---@field clearColor Paint
---@field textureWrapY string
---@field textureWrapX string
---@field canvasMode string
---@field textureFilter string
---@field canvas GroupObject
local SnapshotObject = {}

---  Invalidating snapshots tells Corona to invalidate its texture cache and re-render the children to a texture on the next render pass.  Unlike most other objects in Corona, snapshots will not automatically recognize when children have been modified. This is because there's a cost to rendering to a texture.  
---@param self any
function SnapshotObject.invalidate(self) end

