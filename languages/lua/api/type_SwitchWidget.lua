---@meta

---SwitchWidget objects are created using [widget.newSwitch()][api.library.widget.newSwitch].
---@class SwitchWidget: GroupObject
---@field isOn boolean
local SwitchWidget = {}

---  Used to programatically set the state of a [SwitchWidget][api.type.SwitchWidget]. This also changes the state of the switch visually. 
--- @param isOn boolean Sets the switch to either on (`true`) or off (`false`).
--- @param isAnimated boolean? Applies only to switches with `style` of `"onOff"`. If set to `true`, the switch will visually animate its state change.
--- @param onComplete Listener? A callback function to be called when the switch has changed state.
---@param self any
function SwitchWidget.setState(self, isOn, isAnimated, onComplete) end

