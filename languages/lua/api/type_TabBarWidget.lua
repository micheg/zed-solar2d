---@meta

---TabBarWidget objects are created using [widget.newTabBar()][api.library.widget.newTabBar].
---@class TabBarWidget: GroupObject
local TabBarWidget = {}

---  Use this method to set a specific [TabBarWidget][api.type.TabBarWidget] button to its "selected" state. Optionally, you can invoke the `onPress` listener for the button at the same time.  
--- @param buttonIndex number The button index on the tab bar, starting with `1` indicating the first button from the left.
--- @param simulatePress boolean? If set to `true`, the tab button specified by `buttonIndex` will have its `onPress` listener function called. The default is `false`, meaning that the tab button will appear "selected" but the listener function will not be called.
---@param self any
function TabBarWidget.setSelected(self, buttonIndex, simulatePress) end

