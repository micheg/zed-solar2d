---@meta

---PickerWheelWidget objects are created using [widget.newPickerWheel()][api.library.widget.newPickerWheel].
---@class PickerWheelWidget: GroupObject
local PickerWheelWidget = {}

---  Returns a table with the currently selected value/index of each column in the [PickerWheelWidget][api.type.PickerWheelWidget]. 
--- @return table
---@param self any
function PickerWheelWidget.getValues(self) end

---  Selects a specific row within a specific column of the [PickerWheelWidget][api.type.PickerWheelWidget]. Optionally allows you to snap directly/instantly to the row instead of via default scrolling motion. 
--- @param targetColumn number Integer indicating the column to manipulate, from `1` to the total number of columns in the [PickerWheelWidget][api.type.PickerWheelWidget] <nobr>(left to right)</nobr>.
--- @param targetIndex number Integer indicating the row index to select within the specified column (`targetColumn`). This must be a valid row index from `1` to the total number of rows in the column.
--- @param snapToIndex boolean? If `true`, the specified column+row selection will be instantly selected (no&nbsp;scrolling&nbsp;motion). Default is `false`.
---@param self any
function PickerWheelWidget.selectValue(self, targetColumn, targetIndex, snapToIndex) end

