---@meta

---For object [fills][api.type.ShapeObject.fill] and [strokes][api.type.ShapeObject.stroke], Corona uses the concept of __paint__. Once a paint is declared, it can be applied to objects via [object.fill][api.type.ShapeObject.fill] and [object.stroke][api.type.ShapeObject.stroke].Solid fills and strokes are specified by an array of color channels. For other fill/stroke types, including images, composites, and gradients, please see:* [BitmapPaint][api.type.BitmapPaint] &mdash; used to fill/stroke an object with an image.* [CompositePaint][api.type.CompositePaint] &mdash; used for multi-texture fills/strokes.* [GradientPaint][api.type.GradientPaint] &mdash; used for linear gradient fills/strokes.* [ImageSheetPaint][api.type.ImageSheetPaint] &mdash; used to fill/stroke an object with an [image sheet][api.library.graphics.newImageSheet] frame.
---@class Paint: userdata
---@field blendEquation string
---@field effect string
---@field blendMode string
---@field a number
---@field b number
---@field g number
---@field r number
local Paint = {}

