---@meta

---Physics are commonly used for apps that involve a simulation of objects that move, collide, and interact under various physical forces like gravity. Corona makes it very easy to add physics to your apps, even if you've never worked with a physics engine before. While the underlying engine is built around the popular Box2D, we've taken a different design approach which eliminates a lot of the coding that is traditionally required.To work with the Corona physics engine, just begin with familiar Corona [display&nbsp;objects][guide.media.displayObjects]. Corona treats physical body properties as an extension of its graphics objects, so any standard display object including images, vector objects, or animated sprites can be "made&nbsp;physical" and they will automatically interact with other objects in the simulation.
---@class physics
---@field engineVersion string
local physics = {}

---  This function allows extra physics errors to be caught by Box2D. 
--- @param enabled boolean Allow extra physics errors to be caught by Box2D.
function physics.setDebugErrorsEnabled(enabled) end

---  It's common for Box2D to report multiple contact points during a single iteration of a simulation. This function is use to determine if averaging of all the contact points is enabled.  This function returns `false` (default) if the point of contact reported is the first one reported by Box2D (the&nbsp;order is&nbsp;arbitrary). This function returns `true` if the point of contact reported is the average of all the contact points.  
--- @return boolean
function physics.getAverageCollisionPositions() end

---  Stops the physics engine. This function will return `false` and display a warning message if the API cannot be processed. 
--- @return boolean
function physics.stop() end

---  This function turns almost any Corona display object into a simulated physical object with specific physical properties. It accepts the display object, an optional body type (string), and an optional `params` table containing <nobr>key-value</nobr> pairs that specify the properties for the physics body. Within this `params` table, the following apply:  * If a `radius` value is specified, the body boundaries will be circular, centered at the middle of the display object used to create the physics body.  * If a `shape` table is specified, the body boundaries will follow the polygon provided by the shape. Note that the maximum number of sides per shape is eight (8), and all angles must be __convex__. Specifying a `shape` table will override a `radius` property, if both are specified in the same element. Note that the shape coordinates must be defined in __clockwise__ order, and the first and last vertex must be different.  * A complex body may be constructed by specifying multiple body elements and shapes. For example, if the overall shape of the object is concave or if the shape has more than eight sides, you can use multiple body elements to construct it. See the [Physics Bodies][guide.physics.physicsBodies] guide for more information.  * An optional `box` table allows you to create an offset/angled rectangular body using values for `halfWidth`, `halfHeight`, `x` (offset), `y` (offset), and `angle`.  * Edge shape (chain) bodies can be defined via a `chain` array. See below for details.  * If an `outline` table is specified, the body boundaries will follow the outline provided by [graphics.newOutline()][api.library.graphics.newOutline].  
--- @param object DisplayObject The display object to add a physics body to.
--- @param bodyType string? The body type may be specified in an optional string parameter before the first body element. The possible types are `"static"`, `"dynamic"` and `"kinematic"`. The default type is `"dynamic"` if no value is specified. See [object.bodyType][api.type.Body.bodyType] for more information.
--- @param params table? A table of key-value pairs that specifies the properties of the body — see the next section for details. For <nobr>multi-element</nobr> bodies, multiple distinct `params` tables can be declared in a <nobr>comma-delimited</nobr> series (one&nbsp;for each body element).
--- @return boolean
function physics.addBody(object, bodyType, params) end

---  This function is used to reflect a vector as returned by [physics.rayCast()][api.library.physics.rayCast].  The reflected vector returned represents the direction of the reflection, and has a magnitude (length) of 1.  
--- @param fromX number The starting __x__ position of the ray.
--- @param fromY number The starting __y__ position of the ray.
--- @param hit table An entry from the `hits` array returned by [physics.rayCast()][api.library.physics.rayCast].
function physics.reflectRay(fromX, fromY, hit) end

---  Convenience function for converting from Corona units to MKS units. 
--- @param unitName string Can be one of the following values:* `"length"`* `"velocity"`* `"angularVelocity"`
--- @param value number The value to convert from Corona units to MKS.
--- @return number
function physics.toMKS(unitName, value) end

---  This function start the physics simulation and should be called before any other physics functions.  
--- @param noSleep boolean? Value of `true` prevents all bodies from sleeping; `false` or `nil` allows all bodies to sleep (default&nbsp;mode).
function physics.start(noSleep) end

---  Joints can be used to assemble complex physical objects from multiple rigid bodies. For example, joints can be used to join the limbs of a ragdoll figure, attach the wheels of a vehicle to its body, create a moving elevator platform, and more.  Most joints are used to connect two rigid physical bodies, so you must create these bodies first and then submit them as arguments to this constructor function, along with other properties that vary depending on the joint type.  See the [Physics Joints][guide.physics.physicsJoints] guide to study the various joint types.  
--- @param jointType string One of the following joint types. See the [Physics Joints][guide.physics.physicsJoints] guide to study the various joint types.* `"pivot"`* `"distance"`* `"piston"`* `"friction"`* `"weld"`* `"wheel"`* `"pulley"`* `"touch"`* `"rope"`* `"gear"`
--- @return Joint
function physics.newJoint(jointType) end

---  Removes a physics body from a display object without destroying the entire object. This removes the body created with [physics.addBody()][api.library.physics.addBody].  This API only removes the physics body from the [DisplayObject][api.type.DisplayObject] — it does __not__ remove the display object itself.  This function returns `true` if the body was removed and `false` if the call failed. The API will fail if called in any collision event listener.  
--- @param object DisplayObject The object whose physics body should be removed.
--- @return boolean
function physics.removeBody(object) end

---  Returns the __x__ and __y__ components of the global gravity vector, in units of m/s&sup2;. This takes advantage of the fact that Lua functions can return multiple values, which in this case are:  * `gx` — The global gravity vector in the __x__ direction, in units of m/s&sup2;. * `gy` — The global gravity vector in the __y__ direction, in units of m/s&sup2;. 
--- @return number
function physics.getGravity() end

---  Convenience function for converting from MKS units to Corona units. 
--- @param unitName string Can be one of the following values:* `"length"`				<!-- completion -->* `"velocity"`				<!-- completion -->* `"angularVelocity"`		<!-- completion -->
--- @param value number The value to convert from MKS to Corona units.
--- @return number
function physics.fromMKS(unitName, value) end

---  Sets the accuracy of the engine's velocity calculations. The default value is `8`. 
--- @param value number The number of iterations. The default value is `8`, which means that the engine will iterate through eight velocity approximations per frame for each object. Increasing this number will cause fewer momentary inaccuracies like overlapping objects, but it will increase computational overhead. The default value should work for most general cases.
function physics.setVelocityIterations(value) end

---  This function is used to determine if extra physics errors are allowed to be caught by Box2D. 
--- @return boolean
function physics.getDebugErrorsEnabled() end

---  Because it's common for Box2D to report multiple collision points during a single frame iteration, this setting is useful to report those points as one averaged point. This function applies to all the contact points in the [collision][api.event.collision], [preCollision][api.event.preCollision], and [postCollision][api.event.postCollision] physics events.  
--- @param enabled boolean Enables the averaging of all contact points in a collision between physics bodies.
function physics.setAverageCollisionPositions(enabled) end

---  Sets the accuracy of the engine's position calculations. The default value is `3`.  
--- @param value number The number of iterations. The default value is `3`, which means that the engine will iterate through three position approximations per frame for each object. Increasing this number will cause fewer momentary inaccuracies like overlapping objects, but it will increase computational overhead. The default value should work for most general cases.
function physics.setPositionIterations(value) end

---  Adjusts the physics simulation time flow with a multiplier.  
--- @param scale number Value at which to multiply the physics "time&nbsp;step" on each update.
function physics.setTimeScale(scale) end

---  Get the MKS value of the physics simulation for specific keys. 
--- @param key string The key to get MKS units of. Can be any one of the following values:* `"velocityThreshold"` — corresponds to `b2_velocityThreshold`.* `"timeToSleep"` — corresponds to `b2_timeToSleep`.* `"linearSleepTolerance"` — corresponds to `b2_linearSleepTolerance`.* `"angularSleepTolerance"` — corresponds to `b2_angularSleepTolerance`.
--- @return number
function physics.getMKS(key) end

---  Pause the physics engine. 
function physics.pause() end

---  Sets the internal pixels-per-meter ratio that is used in converting between on-screen Corona coordinates and simulated physics coordinates. This should be done only once, before any physical objects are instantiated.  Changing this value has no visual consequences — it simply affects the accuracy of the physical model. The Box2D engine is tuned for simulating medium-sized objects between 0.1m and 10m in size, so it works best when the objects in your game are mapped to physical properties that fall roughly within this range.  The default scaling value is `30`, which means that the optimal 0.1m to 10m range corresponds to visible objects between 3 and 300 pixels in size. For larger objects, you may wish to increase this value to `60` or more.  You may also want to increase this value if the objects you are simulating seem too sluggish or react too slowly. In this case, they are likely too big and heavy for your purposes — try raising the scale value and/or reduce their densities.  
--- @param value number Sets the scale value. The default scaling value is `30`, which means that the optimal 0.1m to 10m range corresponds to visible objects between 3 and 300 pixels in size.
function physics.setScale(value) end

---  Sets the MKS (meters, kilograms, and seconds) value of the physics simulation for specific keys. This is strictly for advanced purposes — the average developer and project will not require this function. 
--- @param key string The key to set MKS units for. Can be any one of the following values:* `"velocityThreshold"` — corresponds to `b2_velocityThreshold`.* `"timeToSleep"` — corresponds to `b2_timeToSleep`.* `"linearSleepTolerance"` — corresponds to `b2_linearSleepTolerance`.* `"angularSleepTolerance"` — corresponds to `b2_angularSleepTolerance`.
--- @param value number The value of for the chosen MKS key.
function physics.setMKS(key, value) end

---  This function is used to determine if the content origin is the collision point in the [collision][api.event.collision], [preCollision][api.event.preCollision], and [postCollision][api.event.postCollision] physics events. 
--- @return boolean
function physics.getReportCollisionsInContentCoordinates() end

---  Specifies either a frame-based (approximated) physics simulation or a <nobr>time-based</nobr> simulation.  
--- @param dt number Value of physics "time&nbsp;step" in seconds, meaning the time between each physics update in seconds.* Use `0` to get an approximate time-based physics simulation.* Use `-1` to get default behavior (frame-based).* Use `1/30` for 30 updates per second.* Use `1/60` for 60 updates per second.
function physics.setTimeStep(dt) end

---  This function is used to find the objects that collide with a line, and the collision points along that line.  The positions returned are in content space while the normals returned are in local space.  
--- @param fromX number The starting __x__ position of the ray.
--- @param fromY number The starting __y__ position of the ray.
--- @param toX number The ending __x__ position of the ray.
--- @param toY number The ending __y__ position of the ray.
--- @param behavior string? The collision test behavior, in increasing order of performance cost:* `"any"` &mdash; Return one result, but not necessarily the closest one.* `"closest"` &mdash; Return only the closest hit from the starting point, if any. This is the default behavior.* `"unsorted"` &mdash; Return all results in no particular order.* `"sorted"` &mdash; Return all results, sorted from closest to farthest.
function physics.rayCast(fromX, fromY, toX, toY, behavior) end

---  By default, Box2D performs continuous collision detection, which prevents objects from "tunneling." If it were turned off, an object that moves quickly enough could potentially pass through a thin wall.  In certain complex situations where bodies are connected by pivot joints, instability can occur. One way to solve this is to turn up the number of velocity iterations using [physics.setVelocityIterations()][api.library.physics.setVelocityIterations]. However, this can be computationally expensive and reduce frame rates. Another solution is to __disable__ continuous physics. Doing so should prevent the instability without increasing iterations. However, you'll need to make your static bodies extra thick to prevent tunneling effects.  
--- @param enabled boolean Controls whether continuous physics is enabled or not.
function physics.setContinuous(enabled) end

---  This function sets the content origin as the collision point in the [collision][api.event.collision], [preCollision][api.event.preCollision], and [postCollision][api.event.postCollision] physics events.  
--- @param enabled boolean Sets the physics engine to return the specific collision point between two bodies, in content coordinates. This means that when two bodies collide, the `event.x` and `event.y` reported to the collision listener will equate to the exact point where collision occurred.
function physics.setReportCollisionsInContentCoordinates(enabled) end

---  Returns the physics time flow multiplier set via [physics.setTimeScale()][api.library.physics.setTimeScale].  
--- @return number
function physics.getTimeScale() end

---  Sets one of three possible "rendering&nbsp;modes" for the physics engine. While this feature will run on devices, it's most useful in the Corona&nbsp;Simulator when testing/debugging physics behavior.  In `"hybrid"` or `"debug"` mode, physics data is displayed using colored vector graphics which reflect different object body types and attributes. See the [Physics Bodies][guide.physics.physicsBodies#body-type] guide for details on body types.  <div class="inner-table">  Outline&nbsp;Color		Physical&nbsp;Type ----------------------	---------------------- orange					Dynamic physics bodies dark blue				Kinematic physics bodies green					Static, <nobr>non-movable</nobr> physics bodies gray					Bodies which are "sleeping" due to lack of activity light blue				Physical&nbsp;joints <nobr>(see the [Physics Joints][guide.physics.physicsJoints] guide)</nobr>  </div>  
--- @param mode string The draw mode, which can be any of the following:* `"normal"`* `"hybrid"`* `"debug"`
function physics.setDrawMode(mode) end

---  A [ParticleSystem][api.type.ParticleSystem] object contains particles with liquid-like behavior under the [LiquidFun](https://google.github.io/liquidfun/) framework.  Once you create a particle system, you can generate particles using [object:createParticle()][api.type.ParticleSystem.createParticle] or [object:createGroup()][api.type.ParticleSystem.createGroup].  
--- @param params table A table that specifies the properties of the particle system — see the next section for valid entries.
--- @return ParticleSystem
function physics.newParticleSystem(params) end

---  Sets the __x__ and __y__ components of the global gravity vector in units of m/s&sup2;. The default is `( 0, 9.8 )` to simulate standard Earth gravity, pointing downward on the __y__ axis.  Note that this function can be called at any time in the physics simulation, upon which all objects under the effect of gravity will respond to the new values.  
--- @param gx number Sets the global gravity vector in x/y direction, in units of m/s&sup2;. In other words, the "pull" of gravity in the x (horizontal) and y (vertical) directions.
--- @param gy number Sets the global gravity vector in x/y direction, in units of m/s&sup2;. In other words, the "pull" of gravity in the x (horizontal) and y (vertical) directions.
function physics.setGravity(gx, gy) end

---  This function is used to find the objects that intersect with an axis-aligned (non-rotated) box. This box is defined by an <nobr>upper-left</nobr> coordinate and a <nobr>lower-right</nobr> coordinate.  The positions returned are in content space.  
--- @param upperLeftX number The upper-left __x__ coordinate for the box region.
--- @param upperLeftY number The upper-left __y__ coordinate for the box region.
--- @param lowerRightX number The lower-right __x__ coordinate for the box region.
--- @param lowerRightY number The lower-right __y__ coordinate for the box region.
function physics.queryRegion(upperLeftX, upperLeftY, lowerRightX, lowerRightY) end

return physics
