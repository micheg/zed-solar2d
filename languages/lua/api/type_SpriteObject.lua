---@meta

---Sprite objects are created using [display.newSprite()][api.library.display.newSprite].
---@class SpriteObject: DisplayObject
---@field isPlaying boolean
---@field numFrames number
---@field timeScale number
---@field sequence string
---@field frame number
local SpriteObject = {}

---  Pauses the current animation, and frame remains on the currently shown frame. Playback can resume later with [object:play()][api.type.SpriteObject.play]. 
---@param self any
function SpriteObject.pause(self) end

---  Play an animation sequence, starting at the current frame. This does not reset looping.  Note that [object:setSequence()][api.type.SpriteObject.setSequence] must be called before the sequence can be played. Play can also be called after [object:pause()][api.type.SpriteObject.pause]. 
---@param self any
function SpriteObject.play(self) end

---  Sets the frame in the currently loaded sequence. 
--- @param frameIndex number The frame index in the currently loaded sequence you want to be shown. In a sprite sequence, `1` indicates the first frame <nobr>(not `0`)</nobr>.
---@param self any
function SpriteObject.setFrame(self, frameIndex) end

---  Loads an animation sequence by name. 
--- @param sequenceName string? The name of the sequence you want to load (to be played). If not specified, the first frame in the currently loaded sequence will be shown instead.
---@param self any
function SpriteObject.setSequence(self, sequenceName) end

---  Sets a frame in the currently loaded sequence as the reference for anchor points. Anchor point calculations will be performed as if this was the current frame, even when another is actually being displayed. Without this, sequences with variable-sized frames (possibly with trimming) can jump around during scaling and rotation, due to the anchor point resolving to a different position. 
--- @param frameIndex number? The frame index in the currently loaded sequence you want to use as reference. The default is the current frame, or 1 is none has been set. In a sprite sequence, `1` indicates the firstframe <nobr>(not `0`)</nobr>.
---@param self any
function SpriteObject.useFrameForAnchors(self, frameIndex) end

