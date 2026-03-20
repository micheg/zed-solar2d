---@meta

---`EventDispatcher` is any [DisplayObject][api.type.DisplayObject] or the global [Runtime][api.type.Runtime] object which can receive events.
---@class EventDispatcher
local EventDispatcher = {}

---  Adds a listener to the object's list of listeners. When the named event occurs, the listener will be invoked and be supplied with a table representing the event.  Returns `true` if your listener was successfully added to the [EventDispatcher][api.type.EventDispatcher], [Runtime][api.type.Runtime], [DisplayObject][api.type.DisplayObject], etc. Returns `nil` if you have invalid arguments, such as the listener not being a function or if it's a table that doesn't have a function matching the event name.  
--- @param eventName string String specifying the name of the event to listen for. Please refer to the [Events][api.event] documentation for valid event names.
--- @param listener Listener? Listeners can be either functions or table objects. If the event's `event.name` matches this string, the listener will be invoked. Event listeners are either functions or objects (table&nbsp;listeners). This argument is optional if it's a table listener of the same object.
--- @return boolean
---@param self any
function EventDispatcher.addEventListener(self, eventName, listener) end

---  Removes the specified listener from the object's list of listeners so that it no longer is notified of events corresponding to the specified event.  Returns a [boolean][api.type.Boolean] value indicating if the given listener was successfully removed. Will return `false` if given invalid arguments or if the given listener does not exist in the internal listener list.  
--- @param eventName string Specifies the name of the event whose corresponding listener should be removed from the list.
--- @param listener Listener Reference to the listener to remove from the list.
--- @return boolean
---@param self any
function EventDispatcher.removeEventListener(self, eventName, listener) end

---  Dispatches specified `event` to object. The event parameter must be a table with a `name` property which is a [string][api.type.String] identifying the type of event. This method is available for any [DisplayObject][api.type.DisplayObject] or the global [Runtime][api.type.Runtime] object, if it has a listener registered to receive name events. We recommend you also include a `target` property in your event to the event so that your listener can know which object received the event.  In Corona, you can register custom events with both [DisplayObjects][api.type.DisplayObject] or the global [Runtime][api.type.Runtime] object. In both cases, you will have to manually dispatch the event yourself using this object method. 
--- @param event table Contains event properties. The table must contain a `name` property that corresponds to the event you wish to dispatch.
---@param self any
function EventDispatcher.dispatchEvent(self, event) end

