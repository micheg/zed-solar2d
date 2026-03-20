---@meta

---SegmentedControlWidget objects are created using [widget.newSegmentedControl()][api.library.widget.newSegmentedControl].
---@class SegmentedControlWidget: GroupObject
---@field segmentLabel string
---@field segmentNumber number
local SegmentedControlWidget = {}

---  Sets the active segment for a [SegmentedControlWidget][api.type.SegmentedControlWidget].  
--- @param segmentNumber number The segment to set as active. Minimum value is `1`. Maximum value is the total number of segments in the control.
---@param self any
function SegmentedControlWidget.setActiveSegment(self, segmentNumber) end

