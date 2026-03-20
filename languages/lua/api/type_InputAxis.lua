---@meta

---Provides information about one analog axis input belonging to an [InputDevice][api.type.InputDevice], such as an <nobr>__x__-axis</nobr> or <nobr>__y__-axis</nobr> of a joystick, a gamepad's left or right analog trigger, etc. The main usage of this object is to acquire the minimum and maximum values that the axis can provide in order to make sense of its data.This information can also be used to identify an input device's capabilities if the axis [type][api.type.InputAxis.type] is known. For example, you can use this to confirm that an analog joystick is available when an <nobr>__x__-axis</nobr> and <nobr>__y__-axis</nobr> input are found.
---@class InputAxis
---@field minValue number
---@field type string
---@field descriptor string
---@field number number
---@field accuracy number
---@field maxValue number
local InputAxis = {}

