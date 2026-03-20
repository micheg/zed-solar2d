---@meta

---Joints can be used to assemble complex physical objects from multiple rigid bodies. For example, joints can be used to join the limbs of a ragdoll figure, attach the wheels of a vehicle to its body, create a moving elevator platform, and more. All joints are created using the [physics.newJoint()][api.library.physics.newJoint] constructor.Please refer to the [Physics Joints][guide.physics.physicsJoints] guide for details on the setup and configuration of each joint type.
---@class Joint: userdata
---@field motorTorque number
---@field isActive boolean
---@field joint1 userdata
---@field limitState string
---@field joint2 userdata
---@field maxMotorForce number
---@field length1 number
---@field maxForce number
---@field maxMotorTorque number
---@field length number
---@field referenceAngle number
---@field motorForce number
---@field jointAngle number
---@field springFrequency number
---@field springDampingRatio number
---@field jointSpeed number
---@field jointTranslation number
---@field ratio number
---@field dampingRatio number
---@field maxLength number
---@field motorSpeed number
---@field reactionTorque number
---@field isMotorEnabled boolean
---@field frequency number
---@field length2 number
---@field maxTorque number
---@field isLimitEnabled boolean
---@field isCollideConnected boolean
local Joint = {}

---  Returns the __x__ and __y__ coordinates of the joint's anchor point within object `A`, where `A` and `B` are the two joined bodies. Values are in content space. 
--- @return number
---@param self any
function Joint.getAnchorA(self) end

---  Returns the __x__ and __y__ coordinates of a `"pulley"` joint's first ground anchor in content coordinates.  
--- @return number
---@param self any
function Joint.getGroundAnchorA(self) end

---  Returns the __x__ and __y__ coordinates of the joint's anchor point within object `B`, where `A` and `B` are the two joined bodies. Values are in content space. 
--- @return number
---@param self any
function Joint.getAnchorB(self) end

---  Destroys an existing joint and detaches the two joined bodies. This should not be called during a [collision][api.event.collision] event &mdash; instead, set a flag or add a time delay so the destruction can occur in the next application cycle or later, for example via [timer.performWithDelay()][api.library.timer.performWithDelay].  Alternatively, you can destroy a joint via [display.remove()][api.library.display.remove], passing the joint reference as the sole argument. 
---@param self any
function Joint.removeSelf(self) end

---  This function returns the current negative and positive rotation limits of a `"pivot"` joint. 
--- @return number
---@param self any
function Joint.getRotationLimits(self) end

---  This function returns the current negative and positive motion limits for a `"piston"` joint. 
--- @return number
---@param self any
function Joint.getLimits(self) end

---  Returns the __x__ and __y__ coordinates of a `"pulley"` joint's second ground anchor in content coordinates.  
--- @return number
---@param self any
function Joint.getGroundAnchorB(self) end

---  This function returns the reaction force in Newtons at the joint anchor in the second body. 
--- @return number
---@param self any
function Joint.getReactionForce(self) end

---  This function accepts two values which define the negative and positive range of motion for a `"piston"` joint. The second value should always be greater than or equal to the first value, since they define a range of motion (distance) along the axis. 
--- @param negLimit number Negative and positive values for the range of linear motion.
--- @param posLimit number Negative and positive values for the range of linear motion.
---@param self any
function Joint.setLimits(self, negLimit, posLimit) end

---  Returns the __x__ and __y__ coordinates of the joint's anchor point within object `A`, where `A` and `B` are the two joined bodies. Values are relative (local) to object `A`. 
--- @return number
---@param self any
function Joint.getLocalAnchorA(self) end

---  This function returns the current coordinates of the anchor point along the defined axis, in content space.  For use with `"piston"` and `"wheel"` joints. 
--- @return number
---@param self any
function Joint.getLocalAxisA(self) end

---  This function accepts two values, in degrees, defining the negative and positive limits of rotation for a `"pivot"` joint. For example, if you want to limit the rotation somewhat tightly in relation to the upward axis (`0`), these values may be `-10` and `10` respectively. Note that these values remain in relation to the rotation of body `A`, meaning that if body `A` rotates after the joint is declared, these rotation limits will remain in rotational synchronization with that body. 
--- @param negLimit number The negative and positive limits of rotation, in degrees from `0`.
--- @param posLimit number The negative and positive limits of rotation, in degrees from `0`.
---@param self any
function Joint.setRotationLimits(self, negLimit, posLimit) end

---  Sets the current target (follow) point of a `"touch"` joint in content space coordinates. This can be any specific content point, the location of the user's touch, the coordinates of some other object to follow, successive points along a path, etc. 
--- @param targetX number The target coordinates in content space.
--- @param targetY number The target coordinates in content space.
---@param self any
function Joint.setTarget(self, targetX, targetY) end

---  Returns the __x__ and __y__ coordinates of the joint's anchor point within object `B`, where `A` and `B` are the two joined bodies. Values are relative (local) to object `B`. 
--- @return number
---@param self any
function Joint.getLocalAnchorB(self) end

---  Returns the current target coordinates of a `"touch"` joint as specified by [object:setTarget()][api.type.Joint.setTarget]. 
--- @return number
---@param self any
function Joint.getTarget(self) end

