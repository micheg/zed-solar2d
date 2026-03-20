---@meta

---ProgressViewWidget objects are created using [widget.newProgressView()][api.library.widget.newProgressView].
---@class ProgressViewWidget: GroupObject
local ProgressViewWidget = {}

---  Resizes the width of a [ProgressViewWidget][api.type.ProgressViewWidget] after creation.  
--- @param newWidth number The new width of the progress view.
---@param self any
function ProgressViewWidget.resizeView(self, newWidth) end

---  Sets the current progress of a [ProgressViewWidget][api.type.ProgressViewWidget].  
--- @param progress number The progress (percentage) at which to set the progress view. This value must be between `0.0` (empty) and `1.0` (100%&nbsp;full).
---@param self any
function ProgressViewWidget.setProgress(self, progress) end

---  Returns the current progress value of a [ProgressViewWidget][api.type.ProgressViewWidget]. 
--- @return number
---@param self any
function ProgressViewWidget.getProgress(self) end

