---@meta

---Slider objects are created using [widget.newSlider()][api.library.widget.newSlider].
---@class SliderWidget: GroupObject
---@field value number
local SliderWidget = {}

---  Changes the [SliderWidget][api.type.SliderWidget] handle position, as well as the [object.value][api.type.SliderWidget.value] property. 
--- @param percent number The slider's handle location by percentage.
---@param self any
function SliderWidget.setValue(self, percent) end

