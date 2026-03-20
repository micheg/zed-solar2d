---@meta

---The object created by [graphics.newTexture()][api.library.graphics.newTexture] when the specified [type][api.type.TextureResource.type] is `"canvas"`. This texture resource is an <nobr>in-memory</nobr> texture which can be modified by rendering display objects to it. It is similar to a [framebuffer object](https://en.wikipedia.org/wiki/Framebuffer_object) or a [render target texture](https://en.wikipedia.org/wiki/Render_Target).
---@class TextureResourceCanvas: TextureResource
---@field anchorX number
---@field pixelWidth number
---@field anchorY number
---@field pixelHeight number
---@field width number
---@field cache GroupObject
---@field height number
local TextureResourceCanvas = {}

---  Sets the fill color of the texture, also known as the "clear&nbsp;color" or the background. The entire texture will be set to the specified color during the next scheduled <nobr>non-accumulative</nobr> rendering. Default is transparent.  
--- @param gray number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the texture without anything rendered to it.
--- @param red number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the texture without anything rendered to it.
--- @param green number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the texture without anything rendered to it.
--- @param blue number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the texture without anything rendered to it.
--- @param alpha number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the texture without anything rendered to it.
---@param self any
function TextureResourceCanvas.setBackground(self, gray, red, green, blue, alpha) end

---  This method schedules display objects queued for rendering via [texture:draw()][api.type.TextureResourceCanvas.draw] to be rendered to the texture before the next frame.  
--- @param params string? _[String][api.type.String]_ or If specified, one of the following options are valid. If omitted, accumulative rendering of objects from the rendering queue occurs.* Pass a [string][api.type.String] value of `"cache"` to clear the texture and subsequently render objects from the cache to the texture:<div class="code-indent" style="width:500px;">`texture:invalidate( "cache" )`</div>* If you need to render display objects without clearing the texture, pass a [table][api.type.Table] with keys of `source` and `accumulate`. This switches off accumulative rendering and uses the cache as the source for rendering to the texture.<div class="code-indent" style="width:500px;">`texture:invalidate( { source="cache", accumulate=false } )`</div>
---@param self any
function TextureResourceCanvas.invalidate(self, params) end

---  This method adds/renders a [display object][api.type.DisplayObject] to the internal rendering queue of the [TextureResourceCanvas][api.type.TextureResourceCanvas] object. All rendering of queued objects occurs after calling [texture:invalidate()][api.type.TextureResourceCanvas.invalidate].  
--- @param object DisplayObject The object to be inserted into the rendering queue.
---@param self any
function TextureResourceCanvas.draw(self, object) end

