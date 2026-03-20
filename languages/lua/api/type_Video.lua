---@meta

---A video object is a [native display object][api.type.NativeDisplayObject] associated with [native.newVideo()][api.library.native.newVideo].
---@class Video: NativeDisplayObject
---@field isMuted boolean
---@field totalTime number
---@field currentTime number
local Video = {}

---  Seeks and jumps to the specified time in the currently loaded video. Use this in conjunction with [native.newVideo()][api.library.native.newVideo]. 
--- @param timeInSeconds number Jumps to specified time in currently loaded video. Ensure that this is not greater than the [object.totalTime][api.type.Video.totalTime] property.
---@param self any
function Video.seek(self, timeInSeconds) end

---  Pauses the currently loaded video. Use this in conjunction with [native.newVideo()][api.library.native.newVideo]. 
---@param self any
function Video.pause(self) end

---  Plays the currently loaded video. Use this in conjunction with [native.newVideo()][api.library.native.newVideo]. 
---@param self any
function Video.play(self) end

---  Loads a specified video. Use this in conjunction with [native.newVideo()][api.library.native.newVideo].  
--- @param path string The local filename or remote URL for the video.
--- @param baseSource Constant? Controls how `path` is interpreted. It can either be one of the system-defined directory constants, or [media.RemoteSource][api.library.media.RemoteSource] (use this to access video on a remote server).
---@param self any
function Video.load(self, path, baseSource) end

