---@meta

---All drawing that occurs on the screen is accomplished by creating display objects. Anything that appears on the screen is an instance of a display object.
---@class DisplayObject: EventDispatcher
---@field alpha number
---@field contentHeight number
---@field blendMode string
---@field defined string
---@field isHitTestable boolean
---@field anchorY number
---@field isVisible boolean
---@field height number
---@field width number
---@field anchorX number
---@field contentBounds table
---@field properties string
---@field y number
---@field contentWidth number
---@field x number
---@field yScale number
---@field parent GroupObject
---@field lastChange string
---@field maskScaleX number
---@field maskRotation number
---@field maskY number
---@field maskX number
---@field maskScaleY number
---@field isHitTestMasked boolean
---@field rotation number
---@field xScale number
local DisplayObject = {}

---  Effectively adds a value (`deltaAngle`) to the object's current [rotation][api.type.DisplayObject.rotation]. This rotation is based on degrees in the clockwise direction. The rotation occurs around the object's anchor point.  Use [object.rotation][api.type.DisplayObject.rotation] to set (or&nbsp;get) the current rotation value of the object.  
--- @param deltaAngle number Degrees to rotate. A positive number rotates the object clockwise and a negative number rotates the object <nobr>counter-clockwise</nobr>.
---@param self any
function DisplayObject.rotate(self, deltaAngle) end

---  Effectively multiplies the size of a display object by `xScale` and `yScale` respectively. The scaling occurs around the object's anchor point.  Valid examples include `1.0` for 100%, `2.0` for 200%, or `0.5` for 50%.  You can flip a [display object][api.type.DisplayObject] horizontally or vertically by passing a negative value to [object:scale()][api.type.DisplayObject.scale] as seen in the example below.  
--- @param xScale number Factors by which to change the scale in the __x__ and __y__ directions respectively.
--- @param yScale number Factors by which to change the scale in the __x__ and __y__ directions respectively.
---@param self any
function DisplayObject.scale(self, xScale, yScale) end

---  Associates a mask with a display object. To remove an object's mask, use `object:setMask( nil )`. You can modify a display object's mask __x__ and __y__ position ([object.maskX][api.type.DisplayObject.maskX], [object.maskY][api.type.DisplayObject.maskY]), __x-scale__ and __y-scale__ factors ([object.maskScaleX][api.type.DisplayObject.maskScaleX], [object.maskScaleY][api.type.DisplayObject.maskScaleY]), and rotation ([object.maskRotation][api.type.DisplayObject.maskRotation]).  For a walkthrough on how to use image masks, see the [Masking Images][guide.media.imageMask] guide.  
--- @param mask Mask The mask object created with [graphics.newMask()][api.library.graphics.newMask]. Set to `nil` to remove the object's current mask.
---@param self any
function DisplayObject.setMask(self, mask) end

---  Effectively adds values to the [object.x][api.type.DisplayObject.x] and [object.y][api.type.DisplayObject.y] properties of an object, thus changing its screen position. 
--- @param deltaX number Amount to add to the object's __x__ and __y__ properties respectively.
--- @param deltaY number Amount to add to the object's __x__ and __y__ properties respectively.
---@param self any
function DisplayObject.translate(self, deltaX, deltaY) end

---  Removes the display object and frees its memory, assuming there are no other references to it. This is equivalent to calling [group:remove()][api.type.GroupObject.remove] on the same display object, but it is syntactically simpler. The `object:removeSelf()` syntax is also supported in other cases, such as removing physics joints in the physics engine.  When you remove a display object, event listeners that are attached to it&nbsp;&mdash; tap and touch listeners, for example&nbsp;&mdash; are also freed from memory. You don't need to explicitly remove event listeners that are isolated to the object. See the [Display&nbsp;Objects][guide.media.displayObjects] guide for further details on object removal.  The `object:removeSelf()` method converts a display object into a normal Lua table that will be garbage collected if there are not other references to the object. You should also set the object to `nil` after removing it.  
--- @return DisplayObject
---@param self any
function DisplayObject.removeSelf(self) end

---  Moves the target object to the visual front of its parent group ([object.parent][api.type.DisplayObject.parent]). 
---@param self any
function DisplayObject.toFront(self) end

---  Maps the given __x__ and __y__ coordinates of an object to content ([stage][api.type.StageObject]) coordinates.  This method is useful for comparing the location of display objects in different groups. When a display object is inserted into a group, the core __x__ and __y__ properties for the object are relative to its group (parent) and not the content (stage). `object:localToContent()` can be used to return the actual content coordinates of an object, independent of its parent group.  This method is also useful to determine the content coordinates of a specific off-center point on an object, even one that is rotated or scaled. For example, you can pass an __x__ and __y__ value relative to the object's center and retrieve the specific location of that point in content (stage) coordinates. See the example code below.  Note that this method is similar to [object.contentBounds][api.type.DisplayObject.contentBounds], but it returns a specific coordinate point, not the bounding limits of the object.  
--- @param x number Coordinates relative to the display object's center point. Point `0,0` refers to the center point of the object.
--- @param y number Coordinates relative to the display object's center point. Point `0,0` refers to the center point of the object.
--- @return number
---@param self any
function DisplayObject.localToContent(self, x, y) end

---  Maps the given __x__ and __y__ values in content ([stage][api.type.StageObject]) coordinates to the target object's local coordinates (center point).  
--- @param xContent number The __x__ coordinate in content (display) space.
--- @param yContent number The __y__ coordinate in content (display) space.
--- @return number
---@param self any
function DisplayObject.contentToLocal(self, xContent, yContent) end

---  Moves the target object to the visual back of its parent group ([object.parent][api.type.DisplayObject.parent]). 
---@param self any
function DisplayObject.toBack(self) end

