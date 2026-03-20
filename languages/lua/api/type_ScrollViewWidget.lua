---@meta

---ScrollViewWidget objects are created using [widget.newScrollView()][api.library.widget.newScrollView].
---@class ScrollViewWidget: GroupObject
local ScrollViewWidget = {}

---  Updates the scrollable content height of a [ScrollViewWidget][api.type.ScrollViewWidget], meaning the total amount that the user can scroll the view in the vertical direction. 
--- @param newHeight number The new scrollable content height.
--- @return number
---@param self any
function ScrollViewWidget.setScrollHeight(self, newHeight) end

---  Returns a reference to the [ScrollViewWidget][api.type.ScrollViewWidget] object's view. 
--- @return table
---@param self any
function ScrollViewWidget.getView(self) end

---  If you have an object with a touch listener inside a scroll view such as a [ButtonWidget][api.type.ButtonWidget], you should call this method within the `"moved"` phase of that object's touch listener and pass the touch event's `event` table as the sole parameter of this method. This will give focus back to the scroll view, enabling it to continue to scroll. 
--- @param event table The `event` table from the object's touch listener function.
--- @return number
---@param self any
function ScrollViewWidget.takeFocus(self, event) end

---  Updates the width and height of a [ScrollViewWidget][api.type.ScrollViewWidget]. Note that if the scrollWidth or scrollHeight were set or changed, they will be overridden and require to be set once more after this function is called. 
--- @param newWidth number The new width.
--- @param newHeight number The new height.
--- @return number
---@param self any
function ScrollViewWidget.setSize(self, newWidth, newHeight) end

---  Sets a [ScrollViewWidget][api.type.ScrollViewWidget] to either locked (does&nbsp;not&nbsp;scroll) or unlocked (default&nbsp;behavior). Optionally, you can lock or unlock the scroll view on a specific directional axis.  
--- @param isLocked boolean Set to `true` to lock the scroll view; `false` to unlock the scroll view.
--- @param axis string? Directional axis upon which to lock or unlock the scroll view, either `"horizontal"` or `"vertical"`.
---@param self any
function ScrollViewWidget.setIsLocked(self, isLocked, axis) end

---  Updates the scrollable content width of a [ScrollViewWidget][api.type.ScrollViewWidget], meaning the total amount that the user can scroll the view in the horizontal direction. 
--- @param newWidth number The new scrollable content width.
--- @return number
---@param self any
function ScrollViewWidget.setScrollWidth(self, newWidth) end

---  Returns the __x__ and __y__ coordinates of the [ScrollViewWidget][api.type.ScrollViewWidget] content. 
--- @return number
---@param self any
function ScrollViewWidget.getContentPosition(self) end

---  Makes a [ScrollViewWidget][api.type.ScrollViewWidget] scroll to a specified position constant.  
--- @param position string This is the position you wish to scroll to. Valid options are `"top"`, `"bottom"`, `"left"`, or `"right"`.
--- @param options table A table that specifies properties of the call — see the next section for details.
---@param self any
function ScrollViewWidget.scrollTo(self, position, options) end

---  Makes a [ScrollViewWidget][api.type.ScrollViewWidget] scroll to a specific __x__ or __y__ position.  
--- @param x number? The __x__ position to scroll to. If you only want to scroll vertically, you should omit this parameter.
--- @param y number? The __y__ position to scroll to. If you only want to scroll horizontally, you should omit this parameter.
--- @param time number? Time in milliseconds to scroll to the specified coordinate(s). For an instantaneous effect (no&nbsp;transition), set this to `0`. Default is `400`.
--- @param onComplete function? An optional function that will be called when the scroll completes.
---@param self any
function ScrollViewWidget.scrollToPosition(self, x, y, time, onComplete) end

