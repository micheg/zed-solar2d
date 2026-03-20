---@meta

---ButtonWidget objects are created using [widget.newButton()][api.library.widget.newButton].
---@class ButtonWidget: GroupObject
local ButtonWidget = {}

---  Sets/updates the [ButtonWidget][api.type.ButtonWidget] label text. 
--- @param label string The new/updated label for the button.
---@param self any
function ButtonWidget.setLabel(self, label) end

---  Returns the [ButtonWidget][api.type.ButtonWidget] label text as a string.  
--- @return string
---@param self any
function ButtonWidget.getLabel(self) end

---  Sets the [ButtonWidget][api.type.ButtonWidget] as either enabled or disabled.  
--- @param isEnabled boolean Set this to `false` if you wish to disable touch events on the button, `true` if you wish to re-enable the button's ability to receive touch events.
---@param self any
function ButtonWidget.setEnabled(self, isEnabled) end

