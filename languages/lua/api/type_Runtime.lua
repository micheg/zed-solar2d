---@meta

---The `Runtime` class inherits from [EventDispatcher][api.type.EventDispatcher]. It is a singleton class, meaning there is only one instance, accessible via the global runtime.
---@class Runtime: EventDispatcher
local Runtime = {}

---  Returns the time since the application started, as of the start of this frame.  This is also available from the `enterFrame` event's `time` member. 
---@param self any
function Runtime.getFrameStartTime(self) end

---  Determines if the device is capable of providing events for a given event source such as `"accelerometer"` or `"gyroscope"`.  This function returns `true` if the event source exists, meaning it is okay to call [EventDispatcher:addEventListener()][api.type.EventDispatcher.addEventListener] to handle its events.  It returns `false` if the event source does not exist. For example, if this returns false for `"gyroscope"` then this would indicate that the appropriate hardware was not found on the device. 
--- @param eventSourceName string The name of the event source for which to check existence. The following values are valid:* `"accelerometer"`* `"gyroscope"`* `"heading"`* `"inputDeviceStatus"`* `"key"`* `"location"`* `"mouse"`* `"multitouch"`* `"orientation"`
--- @return boolean
---@param self any
function Runtime.hasEventSource(self, eventSourceName) end

---  Returns a value that identifies the current frame.  This is also available from the `enterFrame` event's `frame` member. 
---@param self any
function Runtime.getFrameID(self) end

---  Disables the runtime error alert that appears if the application hits an error condition. This is shorthand for defining your own [unhandledError][api.event.unhandledError] listener and returning `true`.  Note that syntax errors and out of memory errors will still cause an error alert and that disabling the alert does not mean that the error itself is ignored. Errors will still interrupt the execution of Lua code in listeners and functions.  
---@param self any
function Runtime.hideErrorAlerts(self) end

