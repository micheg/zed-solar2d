---@meta

---The Corona Audio system gives you access to advanced OpenAL features. See the [Audio Usage/Functions][guide.media.audioSystem] guide for more information.
---@class audio
---@field unreservedUsedChannels number
---@field unreservedFreeChannels number
---@field usedChannels number
---@field reservedChannels number
---@field totalChannels number
---@field freeChannels number
audio = {}

---  Gets the max volume for a specific channel. There is no max volume for the master volume.  This function returns the channel max volume if requesting a channel, or the average max volume across all channels if `{ channel=0 }` is specified. 
--- @param channel number? The channel number you want to get the max volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specifying `0` will return the average volume across all channels.
--- @return number
function audio.getMaxVolume(channel) end

---  Clamps the minimum volume to the set value. Any volumes that fall below the value will be played at the minimum volume level.  This function returns `true` on success or `false` if otherwise. 
--- @param volume number The new min volume level you want to apply. Valid numbers range from `0.0` to `1.0`, where `1.0` is the maximum value.
--- @param options table Table that supports a single key, `channel`, which is the channel number you want to set the minimum volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specify `0` to apply the minimum volume to all channels.
--- @return boolean
function audio.setMinVolume(volume, options) end

---  Gets the minimum volume for a specific channel. There is no minimum volume for the master volume.  This function returns the channel minimum volume if requesting a channel volume, or the average minimum volume across all channels if `{ channel=0 }` is specified.  
--- @param channel number? The channel number you want to get the minimum volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specifying `0` will return the average volume across all channels.
--- @return number
function audio.getMinVolume(channel) end

---  This function returns the total time in milliseconds of the audio resource. If the total length cannot be determined, `-1` will be returned. 
--- @param audioHandle table The audio object returned by [audio.loadSound()][api.library.audio.loadSound] or [audio.loadStream()][api.library.audio.loadStream].
--- @return number
function audio.getDuration(audioHandle) end

---  Plays the audio specified by the audio handle on a channel. If a channel is not explicitly specified, an available channel will be automatically chosen for you.  This function returns the channel number which the audio plays on, or `0` if the audio could not be played. 
--- @param audioHandle table This is the audio data you want to play (as returned from [audio.loadSound()][api.library.audio.loadSound] and [audio.loadStream()][api.library.audio.loadStream]).
--- @param options table? Additional options for playback — see the next section for details.
--- @return number
function audio.play(audioHandle, options) end

---  This fades a playing sound in a specified amount to a specified volume. The audio will continue playing after the fade completes.  This function returns the number of channels fade is actually applied to. 
--- @param channel number? The channel number you want to fade on. `1` to the maximum number of channels are valid channels. Specify `0` to apply fade to all channels.
--- @param time number? The amount of time (in milliseconds) over which you want the audio to fade. Omitting this parameter invokes a default fade time which is currently 1000 milliseconds.
--- @param volume number? The target volume you want to change (fade) to. Valid numbers are `0.0` to `1.0` where `1.0` is the max volume. If this parameter is omitted, the default value is currently `0.0`.
--- @return number
function audio.fade(channel, time, volume) end

---  Stops a currently playing sound after the specified time delay.  This function returns the number of channels actually applied to or `-1` on error.  
--- @param duration number Time in milliseconds after which to stop playing.
--- @param options table? Table that supports a single key, `channel`, which is the channel to stop. If no parameter is passed, all channels are stopped.
--- @return number
function audio.stopWithDelay(duration, options) end

---  Stops playback on a channel <nobr>(or all channels)</nobr> and clears the channel(s) so they can be played on again. Callbacks will still be invoked, but the completed flag will be set to `false`.  This function returns the number of channels actually stopped or `-1` on error. 
--- @param channel number? The channel to stop. If no parameter is passed, all channels are stopped.
--- @return number
function audio.stop(channel) end

---  Loads (opens) a file to be read as streaming audio. Streamed files are read in little chunks at a time to minimize memory use. These are intended for large/long files like background music and speech. Unlike files loaded with [audio.loadSound()][api.library.audio.loadSound], these cannot be shared simultaneously across multiple channels. If you need to play multiple simulataneous instances of the same file, you must load multiple instances of the file.  This function returns a handle to a sound file. 
--- @param audioFileName string The name of the audio file you want to load. Supported file formats are determined by the platform you are running on.
--- @param baseDir Constant? By default sound files are expected to be in the project folder (`system.ResourceDirectory`). If the sound file is in the application documents directory, use `system.DocumentsDirectory`.
--- @return table
function audio.loadStream(audioFileName, baseDir) end

---  Loads an entire file completely into memory and returns a reference to the audio data. Files that are loaded completely into memory may be reused/played/shared simultaneously on multiple channels so you only need to load one instance of the file. You should use this to load all your short sounds, especially ones you may play frequently. For best results, load all the sounds at the launch of your app or the start of a new level/scene.  This function returns a handle to a sound file. 
--- @param audiofileName string The name of the audio file you want to load. Supported file formats are determined by the platform you are running on.
--- @param baseDir Constant? By default sound files are expected to be in the project folder (`system.ResourceDirectory`). If the sound file is in the application documents directory, use `system.DocumentsDirectory`.
--- @return table
function audio.loadSound(audiofileName, baseDir) end

---  Sets the volume either for a specific channel, or sets the master volume.  This function returns `true` on success, or `false` on failure. 
--- @param volume number The new volume level you want to apply. Valid numbers range from `0.0` to `1.0`, where `1.0` is the maximum value.
--- @param options table Table that supports a single key, `channel`, which is the channel number you want to set the volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specify `0` to apply the volume to all channels. Omitting this parameter entirely sets the master volume which is different than the channel volume. All channel volumes are scaled by the master volume.
--- @return boolean
function audio.setVolume(volume, options) end

---  Returns `true` if the specified channel is currently paused; `false` if not.  
--- @param channel number The channel you want to know is paused or not.
--- @return boolean
function audio.isChannelPaused(channel) end

---  Seeks to a time position on either an active channel or directly on the audio handle.  This function returns `true` on success or `false` if otherwise. 
--- @param time number The time in milliseconds within the audio handle you want to seek to.
--- @param audioHandle table? The audio handle of the data you want to seek. This should only be used for audio loaded with [audio.loadStream()][api.library.audio.loadStream]. Do not use the `options.channel` parameter in the same call.
--- @param options table? Table that supports a single key, `channel`, which is the channel you want the seek operation to apply to. This is best for audio loaded with [audio.loadSound()][api.library.audio.loadSound]. Do not use the `audioHandle` parameter in the same call.
--- @return boolean
function audio.seek(time, audioHandle, options) end

---  Returns `true` if the specified channel is currently playing; `false` if otherwise.  
--- @param channel number The channel you want to know is playing or not.
--- @return boolean
function audio.isChannelPlaying(channel) end

---  Looks for an available audio channel for playback. You can provide a start channel number as parameter and begin searching from that channel, increasing upward to the highest channel. The search does not include reserved channels.  This function returns the channel number of an available channel or `0` if none could be found. 
--- @param startChannel number? The channel number you want to start looking at. Search will increase upwards from this channel. `0` or no parameter begins searching at the lowest possible value.
--- @return number
function audio.findFreeChannel(startChannel) end

---  Rewinds audio to the beginning position on either an active channel or directly on the audio handle (rewinds all channels if no arguments are specified).  This function returns `true` on success or `false` if otherwise. 
--- @param audioHandle table? The audio handle of the data you want to rewind. Should only be used for audio loaded with [audio.loadStream()][api.library.audio.loadStream]. Do not use the channel parameter in the same call.
--- @param options table? Table that supports a single key: `channel`, which is the channel you want the rewind operation to apply to. Best for audio loaded with [audio.loadSound()][api.library.audio.loadSound]. Do not use the `audioHandle` parameter in the same call.
--- @return boolean
function audio.rewind(audioHandle, options) end

---  Resumes playback on a channel that is paused (or all channels if no channel is specified). Should have no effect on channels that aren't paused.  This function returns the number of channels actually resumed or `-1` on error. 
--- @param channel number? The channel to resume. Specifying `0` (or nothing) resumes all channels.
--- @return number
function audio.resume(channel) end

---  Pauses playback on a channel (or all channels if no channels are specified). Has no effect on channels that aren't playing.  This function returns the number of channels actually paused or `-1` on error.  
--- @param channel number The channel to pause. Specifying `0` pauses all channels. If `channel` is omitted, `audio.pause()` will pause all active channels.
--- @return number
function audio.pause(channel) end

---  This stops a playing sound in a specified amount of time and fades to min volume while doing it. The audio will stop at the end of the time and the channel will be freed.  This function returns the number of channels `audio.fadeOut()` is actually applied to. 
--- @param channel number? The channel number you want to fadeOut on. `1` to the maximum number of channels are valid channels. Specify `0` to fade out all channels.
--- @param time number? The amount of time from now (in milliseconds) that you want the audio to fade out over and stop. Omitting this parameter invokes a default fade out time which is currently 1000 milliseconds.
--- @return number
function audio.fadeOut(channel, time) end

---  Clamps the maximum volume to the set value. Any volumes that exceed the value will be played at the maximum volume level.  This function returns `true` on success or `false` if otherwise. 
--- @param volume number The new max volume level you want to apply. Valid numbers range from `0.0` to `1.0`, where `1.0` is the maximum value.
--- @param options table Table that supports a single key, `channel`, which is the channel number you want to set the max volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specify `0` to apply the max volume to all channels.
--- @return boolean
function audio.setMaxVolume(volume, options) end

---  Allows you to reserve a certain number of channels so they won't be automatically assigned to play on. This function blocks off the lower number channels up to the number you specify so they won't be automatically assigned to be played on when you call various play functions.  For example, if there are 32 channels available, and you pass `2` into this function, channels 1 and 2 will be reserved so they won't be played on automatically when you specify you want to play a sound on any available channel. You can still play on channels 1 and 2 if you explicitly designate you want to play on their channel number. This can be useful if you always want your music to be on channel 1 and speech on channel 2 and you don't want sound effects to ever occupy those channels. This allows you to build in certain assumptions about your code, perhaps for example, having different volume levels for music, speech, and sound effects.  Setting this back to `0` will clear all the reserved channels so all will be available again for auto-assignment. Specifying the number of reserve channels to the maximum number of channels will effectively disable auto-assignment.  This function returns the number of currently reserved channels. 
--- @param channels number The number of channels you want to reserve. `0` will un-reserve all channels.
--- @return number
function audio.reserveChannels(channels) end

---  Returns `true` if the specified channel is currently playing or paused; `false` if otherwise. 
--- @param channel number The channel you want to know is active or not.
--- @return boolean
function audio.isChannelActive(channel) end

---  Releases audio memory associated with a handle.  
--- @param audioHandle table The handle returned by [audio.loadSound()][api.library.audio.loadSound] and [audio.loadStream()][api.library.audio.loadStream] that you want to release.
function audio.dispose(audioHandle) end

---  Gets the volume for a specific channel, or gets the master volume.  This function returns:  * The channel volume if requesting a specific channel. * The master volume if no parameters are given. * The average volume across all channels if `{ channel=0 }` is specified. 
--- @param channel number? The channel number you want to get the volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specifying `0` will return the average volume across all channels. Omitting this parameter entirely gets the master volume which is different than the channel volume. All channel volumes are scaled by the master volume.
--- @return number
function audio.getVolume(channel) end

