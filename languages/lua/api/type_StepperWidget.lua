---@meta

---StepperWidget objects are created using [widget.newStepper()][api.library.widget.newStepper].
---@class StepperWidget: GroupObject
---@field minimumValue number
---@field value number
---@field maximumValue number
local StepperWidget = {}

---  This method sets the current value of a [StepperWidget][api.type.StepperWidget]. Note that the value passed to this function will not adhere to the stepper's minimum or maximum value. For example, if the stepper has a maximum value of `10` and you pass `20` as the `value` parameter, the stepper's value will be `20`. Thus, you should only pass in a `value` integer that is within range of your stepper's minimum and maximum values, if defined.  
--- @param value number Integer at which to set the stepper's current value.
---@param self any
function StepperWidget.setValue(self, value) end

---  This method gets the current value of a [StepperWidget][api.type.StepperWidget]. Unlike [object.value][api.type.StepperWidget.value], this is not restricted to usage within the stepper's listener function. 
--- @return number
---@param self any
function StepperWidget.getValue(self) end

