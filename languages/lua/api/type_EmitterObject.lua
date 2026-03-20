---@meta

---This object is used to display particle effects.See the [display.newEmitter()][api.library.display.newEmitter] documentation for details about creating a new emitter.<div class="guide-notebox"><div class="notebox-title">Note</div>To modify the appearance of an emitter object, specific parameters can be set/modified directly as properties of the object &mdash; see the [properties](#properties) section below for a list of valid emitter properties.</div>
---@class EmitterObject: DisplayObject
local EmitterObject = {}

---  Starts the emission of particles from an [EmitterObject][api.type.EmitterObject] if the emitter is [stopped][api.type.EmitterObject.stop], or resumes the emission of particles if the emitter is [paused][api.type.EmitterObject.pause].  <div class="guide-notebox-imp"> <div class="notebox-title-imp">Important</div>  * Emitters begin in the "playing" state and do not need to be "started" by default.  * If you start an emitter from a "stopped" state, and there are existing particles from the emitter on screen <nobr>(from a previously-started emission)</nobr>, all existing particles will instantly be removed.  </div> 
---@param self any
function EmitterObject.start(self) end

---  Pauses (freezes) the [EmitterObject][api.type.EmitterObject]. No particles will be added, removed, or animated while an emitter is paused. 
---@param self any
function EmitterObject.pause(self) end

---  Stops the emission of particles from an [EmitterObject][api.type.EmitterObject]. This function allows the currently active particles to finish their cycle naturally.  To remove all particles instantly, use [object:removeSelf()][api.type.DisplayObject.removeSelf] on the [EmitterObject][api.type.EmitterObject]. 
---@param self any
function EmitterObject.stop(self) end

