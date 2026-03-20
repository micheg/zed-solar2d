---@meta

---Group objects are a special type of [display object][api.type.DisplayObject]. You can add other display objects as children of a group object. You can also remove them. Even if an object is not visible, it remains in the group object until explicitly removed. Thus, to minimize memory consumption, you should explicitly remove any object that will no longer be used.All objects are implicitly added to the current stage, which itself is a kind of group object.Corona does not have layers or levels but groups can be used to simulate the functionally. Objects added to groups can be moved and transposed as a group by controlling the group object.Child objects can also be accessed by array index, for example:`````luagroup[4]:removeSelf()`````See the [Group Programming][guide.graphics.group] guide for more information about group objects.
---@class GroupObject: DisplayObject
---@field numChildren number
---@field anchorChildren number
local GroupObject = {}

---  Remove an object from a group by either an index number or a reference to the object. 
--- @param indexOrChild number _[Number][api.type.Number] or [DisplayObject][api.type.DisplayObject]._ Removes the display object specified from the group, shifting down other elements as needed. The argument is either the index position of the child within group (number) or the child display object itself.
--- @return DisplayObject
---@param self any
function GroupObject.remove(self, indexOrChild) end

---  Inserts an object into a group. 
--- @param index number? Inserts child at `index` into group, shifting up other elements as necessary. The default value index is `n+1` where `n` is the number of children in the group.An easy way to move an object above all its siblings (top) is to re-insert it: `object.parent:insert( object )`.If a group has 3 display objects:* `group[1]` is at the bottom of the group.* `group[2]` is in the middle of the group.* `group[3]` is at the top of the group.Objects at the higher index numbers will be displayed on top of objects with lower index numbers (if the objects overlap).
--- @param child DisplayObject Object to be inserted into the group.
--- @param resetTransform boolean? Determines what happens to child’s transform. When `false`, child’s local position, rotation, and scale properties are preserved, except the local origin is now relative to the new parent group, not its former parent; When `true`, child’s transform is reset (i.e. the `x`, `y`, `rotation`, `xScale`, and `yScale` properties of child are reset to `0`, `0`, `0`, `1`, and `1`, respectively). The default value for `resetTransform` is `false`.
---@param self any
---@overload fun (child:DisplayObject, resetTransform:boolean?)
---@overload fun (child:DisplayObject)
function GroupObject.insert(self, index, child, resetTransform) end

