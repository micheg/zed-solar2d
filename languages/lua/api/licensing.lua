---@meta

---The Solar2D licensing library lets you check to see if the app was bought from a store. Currently, only [Google&nbsp;Play](https://developer.android.com/google/play/licensing/setting-up) is supported.For further information, see the Google [licensing](https://developer.android.com/google/play/licensing/licensing-reference.html) reference page.
---@class licensing
local licensing = {}

---  Starts the licensing verification process. 
--- @param listener Listener Listener function for handling the status of the licensing verification. The properties sent to this listener correspond with [licensing events][api.event.licensing].
function licensing.verify(listener) end

---  Initializes the licensing service library by specifying the name of the licensing provider. Currently, only `"google"` is supported.  Returns `true` if successful; otherwise returns `false`.  
--- @param providerName string String containing the provider's name.
--- @return boolean
function licensing.init(providerName) end

return licensing
