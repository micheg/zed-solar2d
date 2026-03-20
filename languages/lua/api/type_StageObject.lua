---@meta

---This object is the current "stage" object, which is the parent group for all display objects and child groups. This global stage object can be retrieved at any time via [display.getCurrentStage()][api.library.display.getCurrentStage] or [display.currentStage][api.library.display.currentStage].
---@class StageObject: GroupObject
local StageObject = {}

---  Sets a specific [display object][api.type.DisplayObject] as the target for all future [touch][api.event.touch] events. Pass `nil` to restore default behavior for touch event dispatches.  <div class="guide-notebox"> <div class="notebox-title">Note</div>  The global [StageObject][api.type.StageObject] can be retrieved at any time via [display.getCurrentStage()][api.library.display.getCurrentStage] or [display.currentStage][api.library.display.currentStage].  </div>  
--- @param displayObject DisplayObject Reference to a display object to set focus on.
--- @param touchID userdata? The touch ID passed to the touch event for the touched object. This only applies when [multitouch][guide.events.touchMultitouch] is __enabled__ via [system.activate()][api.library.system.activate].
---@param self any
function StageObject.setFocus(self, displayObject, touchID) end

