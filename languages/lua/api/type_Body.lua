---@meta

---Body objects are what interact with the physics world in Corona, are attached to [display objects][api.type.DisplayObject] and are created using [physics.addBody()][api.library.physics.addBody].
---@class Body
---@field isFixedRotation boolean
---@field mass number
---@field linearDamping number
---@field angularDamping number
---@field bodyType string
---@field isSensor boolean
---@field isSleepingAllowed boolean
---@field angularVelocity number
---@field isAwake boolean
---@field gravityScale number
---@field isBullet boolean
---@field isBodyActive boolean
local Body = {}

---  A function that returns the __x__ and __y__ components for the body's center of mass in content coordinates. 
--- @return number
---@param self any
function Body.getMassWorldCenter(self) end

---  A function that returns the __x__ and __y__ components for the body's linear velocity, in pixels per second. 
--- @return number
---@param self any
function Body.getLinearVelocity(self) end

---  Similar to [object:applyTorque()][api.type.Body.applyTorque] except that an angular impulse is a single momentary jolt. 
--- @param appliedForce number Amount of force to apply.
---@param self any
function Body.applyAngularImpulse(self, appliedForce) end

---  If the default mass data for the body has been overridden, this function resets it to the mass calculated from the shapes. 
---@param self any
function Body.resetMassData(self) end

---  This function accepts __x__ and __y__ components for the body's linear velocity, in pixels per second. 
--- @param xVelocity number Value for the velocity in the __x__ and __y__ directions respectively.
--- @param yVelocity number Value for the velocity in the __x__ and __y__ directions respectively.
---@param self any
function Body.setLinearVelocity(self, xVelocity, yVelocity) end

---  A function that accepts __x__ and __y__ components of a linear force, applied at a given point with __x__ and __y__ world coordinates. If the target point is the body's center of mass, it will tend to push the body in a straight line; if the target is offset from the body's center of mass, the body will spin about its center of mass.  For symmetrical objects, the center of mass and the center of the object will have the same position ([object.x][api.type.DisplayObject.x] and [object.y][api.type.DisplayObject.y]).  Note that the amount of force required to move heavy objects may need to be fairly high. 
--- @param xForce number Amount of force to apply in the __x__ and __y__ directions respectively.
--- @param yForce number Amount of force to apply in the __x__ and __y__ directions respectively.
--- @param bodyX number Point on the object to apply the force to.
--- @param bodyY number Point on the object to apply the force to.
---@param self any
function Body.applyForce(self, xForce, yForce, bodyX, bodyY) end

---  Similar to [object:applyForce()][api.type.Body.applyForce] except that an impulse is a single momentary jolt. 
--- @param xForce number Amount of force to apply in the __x__ and __y__ directions respectively.
--- @param yForce number Amount of force to apply in the __x__ and __y__ directions respectively.
--- @param bodyX number Point on the object to apply the force to.
--- @param bodyY number Point on the object to apply the force to.
---@param self any
function Body.applyLinearImpulse(self, xForce, yForce, bodyX, bodyY) end

---  A function that returns the __x__ and __y__ components for the body's local center of mass. 
--- @return number
---@param self any
function Body.getMassLocalCenter(self) end

---  A function that accepts a numerical value for applied rotational force. The body will rotate about its center of mass.  
--- @param appliedForce number Amount of force to be applied.
---@param self any
function Body.applyTorque(self, appliedForce) end

