---@meta

---Particle system objects are created using [physics.newParticleSystem()][api.library.physics.newParticleSystem].
---@class ParticleSystem: DisplayObject
---@field particleGravityScale number
---@field particleDestructionByAge boolean
---@field particleDensity number
---@field particleRadius number
---@field particleStrictContactCheck boolean
---@field particleDamping number
---@field particlePaused boolean
---@field particleMaxCount number
---@field imageRadius number
---@field particleCount number
---@field particleMass number
local ParticleSystem = {}

---  This function is used to remove all particles within a region. It will return a [number][api.type.Number] indicating how many particles were destroyed.  
--- @param params table A table that specifies the region of particles to destroy — see the next section for valid entries.
--- @return number
---@param self any
function ParticleSystem.destroyParticles(self, params) end

---  This function is used to find the particles that intersect with an <nobr>axis-aligned</nobr> <nobr>(non-rotated)</nobr> box. This box is defined by an <nobr>upper-left</nobr> coordinate and a <nobr>lower-right</nobr> coordinate.  This function returns an [array][api.type.Array] of tables describing each hit. The positions returned are in content space.  
--- @param upperLeftX number The upper-left __x__ coordinate for the box region.
--- @param upperLeftY number The upper-left __y__ coordinate for the box region.
--- @param lowerRightX number The lower-right __x__ coordinate for the box region.
--- @param lowerRightY number The lower-right __y__ coordinate for the box region.
--- @param hitProperties table? Table of optional properties which can be applied to each particle in the region. Acceptable options include:* `deltaX` &mdash; The __x__ position delta to apply to each particle.* `deltaY` &mdash; The __y__ position delta to apply to each particle.* `velocityX` &mdash; The __x__ velocity to apply to each particle.* `velocityY` &mdash; The __y__ velocity to apply to each particle.* `deltaVelocityX` &mdash; The __x__ velocity delta to apply to each particle.* `deltaVelocityY` &mdash; The __y__ velocity delta to apply to each particle.
--- @return Array
---@param self any
function ParticleSystem.queryRegion(self, upperLeftX, upperLeftY, lowerRightX, lowerRightY, hitProperties) end

---  This function is used to create a single particle in a [ParticleSystem][api.type.ParticleSystem].  
--- @param params table A table that specifies the particle properties (flags) — see the next section for valid entries.<div class="guide-notebox-imp"><div class="notebox-title-imp">Important</div>When implementing particle collisions via the [particleCollision][api.event.particleCollision] event, you must set the `"fixtureContactListener"` flag for each particle. If this flag is omitted, you will not receive particle collision responses.</div>
---@param self any
function ParticleSystem.createParticle(self, params) end

---  This function is used to find the particles that collide with a line. It returns an [array][api.type.Array] of tables describing each hit.  
--- @param from_x number The starting __x__ position of the ray.
--- @param from_y number The starting __y__ position of the ray.
--- @param to_x number The ending __x__ position of the ray.
--- @param to_y number The ending __y__ position of the ray.
--- @param behavior string? The collision test behavior, in increasing order of performance cost:* `"any"` &mdash; Return one result, but not necessarily the closest one.* `"closest"` &mdash; Return only the closest hit from the starting point, if any. This is the default behavior.* `"unsorted"` &mdash; Return all results in no particular order.* `"sorted"` &mdash; Return all results, sorted from closest to farthest.
--- @return Array
---@param self any
function ParticleSystem.rayCast(self, from_x, from_y, to_x, to_y, behavior) end

---  Similar to [object:applyForce()][api.type.ParticleSystem.applyForce] except that an impulse is a single momentary jolt in <nobr>newton-seconds.</nobr> 
--- @param xForce number Amount of impulse force to apply in the __x__ and __y__ directions respectively.
--- @param yForce number Amount of impulse force to apply in the __x__ and __y__ directions respectively.
---@param self any
function ParticleSystem.applyLinearImpulse(self, xForce, yForce) end

---  A function that accepts __x__ and __y__ components of a linear force in newtons, applied to the center of each particle in a [ParticleSystem][api.type.ParticleSystem]. 
--- @param xForce number Amount of force to apply in the __x__ and __y__ directions respectively.
--- @param yForce number Amount of force to apply in the __x__ and __y__ directions respectively.
---@param self any
function ParticleSystem.applyForce(self, xForce, yForce) end

---  This function is used to create multiple particles simultaneously by filling a region.  
--- @param params table A table that specifies the particle group properties (flags) — see the next section for valid entries.<div class="guide-notebox-imp"><div class="notebox-title-imp">Important</div>When implementing particle collisions via the [particleCollision][api.event.particleCollision] event, you must set the `"fixtureContactListener"` flag for the particle group. If this flag is omitted, you will not receive particle collision responses.</div>
---@param self any
function ParticleSystem.createGroup(self, params) end

