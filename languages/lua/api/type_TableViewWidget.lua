---@meta

---TableViewWidget objects are created using [widget.newTableView()][api.library.widget.newTableView].
---@class TableViewWidget: GroupObject
local TableViewWidget = {}

---  This method is used to delete a row contained inside a [TableViewWidget][api.type.TableViewWidget].  
--- @param rowIndex number The row index to delete.
---@param self any
function TableViewWidget.deleteRow(self, rowIndex) end

---  This method is used to reload <nobr>(re-render)</nobr> the visible rows of a [TableViewWidget][api.type.TableViewWidget]. 
---@param self any
function TableViewWidget.reloadData(self) end

---  Makes a [TableViewWidget][api.type.TableViewWidget] scroll to a specific __y__ position. Note that the current __y__ position can be retrieved with [object:getContentPosition()][api.type.TableViewWidget.getContentPosition]. 
--- @param y number The __y__ position to scroll to.
--- @param time number? Time in milliseconds to scroll to the specified position. For an instantaneous effect (no&nbsp;transition), set this to `0`. Default is `400`.
--- @param onComplete function? An optional function that will be called when the scroll completes.
---@param self any
function TableViewWidget.scrollToY(self, y, time, onComplete) end

---  Sets a [TableViewWidget][api.type.TableViewWidget] to either locked (does&nbsp;not&nbsp;scroll) or unlocked (default&nbsp;behavior).  
--- @param isLocked boolean Set to `true` to lock the table view; `false` to unlock the table view.
---@param self any
function TableViewWidget.setIsLocked(self, isLocked) end

---  This method is used to delete rows contained inside a [TableViewWidget][api.type.TableViewWidget].  
--- @param rowArray Array A Lua array of row indices to delete, for example `{ 2,3,5 }`.
--- @param animationOptions table? An optional table of time animation options for the deletion effect. This table accepts two parameters, `slideLeftTransitionTime` and `slideUpTransitionTime`, both of which represent a time in milliseconds for the animation.
---@param self any
function TableViewWidget.deleteRows(self, rowArray, animationOptions) end

---  Returns the row group reference to a specific __visible__ row in a [TableViewWidget][api.type.TableViewWidget].  
--- @param rowIndex number The index of the row.
--- @return GroupObject
---@param self any
function TableViewWidget.getRowAtIndex(self, rowIndex) end

---  Makes a [TableViewWidget][api.type.TableViewWidget] scroll to a specific row.  <!---  When complete, the top of the row will be at the top position of the table view (plus its `topPadding` value, if any).  --> 
--- @param rowIndex number The row index to scroll to.
--- @param time number? Time in milliseconds to scroll to the specified row index. For an instantaneous effect (no&nbsp;transition), set this to `0`. Default is `400`.
--- @param onComplete function? An optional function that will be called when the scroll completes.
---@param self any
function TableViewWidget.scrollToIndex(self, rowIndex, time, onComplete) end

---  Returns the number of rows contained in a [TableViewWidget][api.type.TableViewWidget]. 
--- @return number
---@param self any
function TableViewWidget.getNumRows(self) end

---  Returns the __y__ coordinate of the [TableViewWidget][api.type.TableViewWidget] content. 
--- @return number
---@param self any
function TableViewWidget.getContentPosition(self) end

---  This method is used for inserting rows into a [TableViewWidget][api.type.TableViewWidget]. 
--- @param id string? An optional identification to assign to the row. Default value is the row's index.
--- @param rowHeight number? The total height of the row in pixels.
--- @param rowColor table? Table of two RGB+A color settings, one each for the default and over states.<div class="code-indent" style="width:500px;">``````luarowColor = { default={ 1, 1, 1 }, over={ 1, 0.5, 0, 0.2 } }``````</div>
--- @param lineColor table? A table of RGB+A values that define the color of the separator line, assuming lines are set to visible.<div class="code-indent" style="width:500px;">``````lualineColor = { 0.5, 0.5, 0.5 }``````</div>
--- @param isCategory boolean? If `true`, the row will be rendered as a category row. Category rows "stick" to the top of the table view as the user scrolls, indicating that the rows underneath are part of that category.
--- @param params table? A table which can contain information pertaining to the specific row. This information can then be accessed (read) in the row rendering function via `event.row.params` and in the row touch listener via `event.target.params`.
---@param self any
function TableViewWidget.insertRow(self, id, rowHeight, rowColor, lineColor, isCategory, params) end

---  This method is used to delete __all__ rows contained inside a [TableViewWidget][api.type.TableViewWidget]. 
---@param self any
function TableViewWidget.deleteAllRows(self) end

