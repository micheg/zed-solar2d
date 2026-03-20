---@meta

---Recording objects are created using [media.newRecording()][api.library.media.newRecording].
---@class Recording: userdata
local Recording = {}

---  Start recording audio.  
---@param self any
function Recording.startRecording(self) end

---  Gets the current audio recording sample rate.  
--- @return number
---@param self any
function Recording.getSampleRate(self) end

---  Returns `true` if audio recording is currently in progress; `false` if otherwise. 
--- @return boolean
---@param self any
function Recording.isRecording(self) end

---  Request an audio recording sample rate.  The recording sample rate defaults to `44100`. Not all platforms may support all rates. Valid rates are `8000`, `11025`, `16000`, `22050`, `44100`. 
--- @param r number Requested sampling rate. Different platforms support different rates; use [object:getSampleRate()][api.type.Recording.getSampleRate] to find out the actual sampling rate.
---@param self any
function Recording.setSampleRate(self, r) end

---  Stops recording audio.  
---@param self any
function Recording.stopRecording(self) end

