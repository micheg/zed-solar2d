---@meta

---Vector display objects are objects created without the use of images, such as rectangles, circles, rounded rectangles, and lines.
---@class ShapeObject: DisplayObject
---@field strokeWidth number
---@field path Path
---@field fillVertexCount number
---@field stroke Paint
---@field fill Paint
---@field strokeVertexCount number
local ShapeObject = {}

---  Sets the stroke (border) color of vector objects.  
--- @param gray number Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke.
--- @param red number Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke.
--- @param green number Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke.
--- @param blue number Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke.
--- @param alpha number Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke.
---@param self any
function ShapeObject.setStrokeColor(self, gray, red, green, blue, alpha) end

---  Sets the color of a particular stroke vertex in vector objects.  Until a given stroke vertex color has been assigned, it is interpreted as white. The color of the object at each vertex is a combination of its stroke color and stroke vertex color: the two red values multiplied together produce the final red, and so on for the remaining channels. When the object is drawn, the resulting colors are interpolated between neighboring vertices.  The first time this is called on an object, some extra memory will be allocated to it to store the colors. 
--- @param index number _[Numbers][api.type.Number]_ Integer from 1 to [object.strokeVertexCount][api.type.ShapeObject.strokeVertexCount] indicating which stroke vertex to color.
--- @param gray number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke color/tint.
--- @param red number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke color/tint.
--- @param green number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke color/tint.
--- @param blue number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke color/tint.
--- @param alpha number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke color/tint.
---@param self any
function ShapeObject.setStrokeVertexColor(self, index, gray, red, green, blue, alpha) end

---  Sets the fill color of vector and text objects. Also applies a tint to image objects.  
--- @param gray number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.
--- @param red number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.
--- @param green number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.
--- @param blue number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.
--- @param alpha number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.
--- @param gradient table? _[Table][api.type.Table]_. See the gradient fill example below.
---@param self any
function ShapeObject.setFillColor(self, gray, red, green, blue, alpha, gradient) end

---  Sets the color of a particular fill vertex in vector and text objects. Also applies a tint to image objects.  Until a given fill vertex color has been assigned, it is interpreted as white. The color/tint of the object at each vertex is a combination of its fill color and fill vertex color: the two red values multiplied together produce the final red, and so on for the remaining channels. When the object is drawn, the resulting colors/tints are interpolated between neighboring vertices.  The first time this is called on an object, some extra memory will be allocated to it to store the colors. 
--- @param index number _[Numbers][api.type.Number]_ Integer from 1 to [object.fillVertexCount][api.type.ShapeObject.fillVertexCount] indicating which fill vertex to color.In the case of meshes, many methods operate on vertices. In those instances and here, `index` refers to the same vertex. (**TODO** Other shapes. At this point the details are unlikely to change; none of it is written down though.)
--- @param gray number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.
--- @param red number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.
--- @param green number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.
--- @param blue number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.
--- @param alpha number? Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.
---@param self any
function ShapeObject.setFillVertexColor(self, index, gray, red, green, blue, alpha) end

