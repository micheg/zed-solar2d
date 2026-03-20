---@meta

---The media library provides access to the multimedia features of the device, including audio, video, camera, and the photo library.Note that the audio functions in this library are also available as part of the <nobr>OpenAL-based</nobr> [audio][api.library.audio] library which supports multiple channels and a wide range of other features.
---@class media
---@field RemoteSource Constant
media = {}

---  Adds specified file to photo library. 
--- @param filename string The name of the image file to be added to the photo library, relative to `baseDirectory` (or `system.ResourceDirectory` by default).
--- @param baseDir Constant? Path to load the image data from filename. Default is `system.ResourceDirectory`. See [system.pathForFile()][api.library.system.pathForFile] for valid values).
function media.save(filename, baseDir) end

---  Plays an event sound <nobr>(1-3 seconds)</nobr>. The first argument may be either an event sound ID or a filename for the event sound. This function is recommended for short sounds, especially to avoid performance hiccups.  
--- @param sound userdata _[Userdata][api.type.Userdata] or [String][api.type.String]._ The first argument is either an event sound ID <nobr>(from [media.newEventSound()][api.library.media.newEventSound])</nobr> or a filename for the event sound.
--- @param baseDir Constant? If specified, this argument is the directory where the sound file is located, if you specified a filename for `sound`. The default is `system.ResourceDirectory`. Other options include:* `system.DocumentsDirectory`* `system.ApplicationSupportDirectory`* `system.TemporaryDirectory`* `system.CachesDirectory`
--- @param completionListener function? If specified, a listener function that will be called each time the event sound is played. Note, however, that Android does not support this functionality.
function media.playEventSound(sound, baseDir, completionListener) end

---  Plays the video at the specified path (both local and remote) in a device-specific popup media player.  During video playback, the media player interface takes over. If the `showControls` function argument is `true`, the user can adjust playback (start, stop, seek, etc.). Additionally, you may specify a listener to get notified when the video has ended. Note that this function is asynchronous, so any code that follows will be executed. After that, the application code will continue to run on iOS devices, but on Android devices, the application will be suspended until the video playback is complete.  Supported video formats are platform- and version-dependent. The iOS video player supports playback of movie files with the `.mov`, `.mp4`, `.m4v`, and `.3gp` filename extensions and using the following compression standards:  * H.264 Baseline Profile Level 3.0 video, up to 640&times;480 at 30 frames per second. Note that B frames are not supported in the Baseline profile. * MPEG-4 Part 2 video (Simple Profile). 
--- @param path string The local filename or a remote URL for the video.
--- @param baseSource Constant? Optional parameter that controls how the local filename path is interpreted. It can either be one of the system-defined directory constants, or `media.RemoteSource` (use this to access video on a remote server).
--- @param showControls boolean If `true`, then the user can adjust playback (start, stop, seek, etc.).
--- @param listener Listener? Listener to notify when the video has ended. The listener can be either a function listener or a table listener. If it's a table, it must have a completion method. The event dispatched to the listener will be a completion event.
---@overload fun (path:string, showControls:boolean, listener:Listener?)
---@overload fun (path:string, showControls:boolean)
function media.playVideo(path, baseSource, showControls, listener) end

---  Stops playback of the extended sound currently opened by the previous call to [media.playSound()][api.library.media.playSound]. 
function media.stopSound() end

---  Plays an extended sound <nobr>(as opposed to an [event sound][api.library.media.playEventSound])</nobr> or resumes play of a paused extended sound. You can only have one such sound file open at a time.  You can optionally specify a callback function to be called whenever playback has finished.  
--- @param soundfile string Name of the sound file. The file must be in a format that is supported by the platform.
--- @param baseDir Constant? If specified, this argument is the directory where the sound file is located (if you specified a filename for `sound`). The default is `system.ResourceDirectory`. Other options include:* `system.DocumentsDirectory`* `system.ApplicationSupportDirectory`* `system.TemporaryDirectory`* `system.CachesDirectory`
--- @param onComplete function? If specified, this argument is a completion listener (callback&nbsp;function) that will be called each time the sound finishes playing.
--- @param loop boolean? If `true`, the sound will be played repeatedly. The default is `false`.
function media.playSound(soundfile, baseDir, onComplete, loop) end

---  Opens a platform-specific interface to the device's camera. This function is asynchronous, meaning that it returns immediately so the calling code will continue to execute until the end of its scope; after that, the application will be suspended until the session is complete. A listener is required to handle the captured object (URL) which can be used in [native.newVideo()][api.library.native.newVideo] and [media.playVideo()][api.library.media.playVideo]. 
--- @param listener Listener Can be either a function listener or a table listener. If a table, it must have a completion method. The event dispatched to the listener will be a completion event with the following additional properties:* `event.url` is a [String][api.type.String] which is the URL of the video. If the operation was cancelled, this value will be `nil`.* `event.completed` will be `true` if the user captured a video; `false` if the user cancelled the video capture.* `event.duration` will be the number of seconds of the video if the user captured a video; `nil` if the user cancelled the video capture or the value could not be obtained.* `event.fileSize` will be the number of bytes of the user captured a video; `nil` if the user cancelled the video capture or the value could not be obtained.
--- @param preferredQuality string? A string indicating the quality of the video you want to take. The acceptable values are `"high"`, `"medium"`, or `"low"`. Default value is `"low"`. On Android, there is no `"medium"` quality level and if that value is passed, `"low"` will be used instead.
--- @param preferredMaxDuration number? The maximum duration of the taken video in seconds. This setting may not work on all devices and it is advised to check against the event to verify.
function media.captureVideo(listener, preferredQuality, preferredMaxDuration) end

---  Create an object for audio recording ([Recording][api.type.Recording]). 
--- @param path string? The path of the file in which to record audio data. If no file is specified, the output goes nowhere.
--- @return Recording
function media.newRecording(path) end

---  Opens a platform-specific interface to the device's photo library. This function is asynchronous, meaning that it returns immediately so the calling code will continue to execute until the end of its scope; after that, the application will be suspended until the session is complete. 
--- @param listener Listener Can be either a function listener or a table listener. If a table, it must have a completion method. The event dispatched to the listener will be a completion event with the following additional properties:* `event.url` is a [string][api.type.String] which is the URL of the video. If the operation was cancelled, this value will be `nil`.* `event.completed` will be `true` if the user captured a video; `false` if the user cancelled the video selection.* `event.duration` will be the number of seconds of the video if the user selected a video; `nil` if the user cancelled the video selection or the value could not be obtained. On some Android app/device combinations, this can occur if the `android.permission.READ_EXTERNAL_STORAGE` permission is missing.* `event.fileSize` will be the number of bytes of the user selected a video; `nil` if the user cancelled the video selection or the value could not be obtained. On some Android app/device combinations, this can occur if the `android.permission.READ_EXTERNAL_STORAGE` permission is missing.
--- @param mediaSource Constant? Can be one of the following:* `media.PhotoLibrary`* `media.SavedPhotosAlbum`
--- @param origin table? Only applicable on iPad. Defines the bounds of the object (typically&nbsp;a&nbsp;button) from which the iPad's popup emerges from. A convenience pattern is to pass the `contentBounds` property of the object.
--- @param permittedArrowDirections table? Only applicable on iPad. An array of values which defines the directions in which the iPad's popup arrow may point. Valid values are `"up"`, `"down"`, `"left"`, `"right"`, or `"any"`. The default is `"any"`.
function media.selectVideo(listener, mediaSource, origin, permittedArrowDirections) end

---  Pauses playback of the extended sound currently opened by the previous call to [media.playSound()][api.library.media.playSound]. Use [media.playSound()][api.library.media.playSound] to resume playback of a paused sound. 
function media.pauseSound() end

------  Opens a platform-specific interface to the device's camera. This function is asynchronous, meaning that it returns immediately so the calling code will continue to execute until the end of its scope; after that, the application will be suspended until the session is complete. By default, the image object is added to the top of the current stage, although there is an option to save the image to a directory instead. 
--- @param listener Listener Can be either a function listener or a table listener. If a table, it must have a completion method. The event dispatched to the listener will be a completion event with the following additional properties:* `event.target` is a [DisplayObject][api.type.DisplayObject] based on the `mediaSource` parameter. If the chosen image is saved to a file, there is no display object added to the stage and this value will be `nil`.* `event.completed` will be `true` if the user selected a photo; `false` if the user cancelled the camera or photo selection.
--- @param destination table? If provided, the chosen image is saved to a file. In this case, there is no [DisplayObject][api.type.DisplayObject] added to the stage and to event sent to listener. This table should be in the form <nobr>`{ [baseDir= ,] filename= }`</nobr>. If `baseDir` is specified, this is the directory [constant][api.type.Constant] to which to save the file.
function media.capturePhoto(listener, destination) end

---  Adjusts the playback volume of an extended sound ([media.playSound()][api.library.media.playSound]). This setting can be adjusted at any time before or during the extended sound playback.  
--- @param volume number This parameter controls the volume. Values must be in the range from `0.0` (muted) to `1.0` (loudest).
function media.setSoundVolume(volume) end

---  Opens a platform-specific interface to the device's photo library. This function is asynchronous, meaning that it returns immediately so the calling code will continue to execute until the end of its scope; after that, the application will be suspended until the session is complete. By default, the image object is added to the top of the current stage, although there is an option to save the image to a directory instead. 
--- @param listener Listener Can be either a function listener or a table listener. If a table, it must have a completion method. The event dispatched to the listener will be a completion event with the following additional properties:* `event.target` is a [DisplayObject][api.type.DisplayObject] based on the `mediaSource` parameter. If the chosen image is saved to a file, there is no display object added to the stage and this value will be `nil`.* `event.completed` will be `true` if the user selected a photo; `false` if the user cancelled the camera or photo selection.	media.selectPhoto( { listener=sessionComplete } )
--- @param mediaSource Constant? Can be one of the following:* `media.PhotoLibrary`* `media.SavedPhotosAlbum`
--- @param destination table? If provided, the chosen image is saved to a file. In this case, there is no [DisplayObject][api.type.DisplayObject] added to the stage. This table should be in the form <nobr>`{ [baseDir= ,] filename= }`</nobr>. If `baseDir` is specified, this is the directory [constant][api.type.Constant] to which to save the file.
--- @param origin table? Only applicable on iPad. Defines the bounds of the object (typically&nbsp;a&nbsp;button) from which the iPad's popup emerges from. A convenience pattern is to pass the `contentBounds` property of the object.
--- @param permittedArrowDirections table? Only applicable on iPad. An array of values which defines the directions in which the iPad's popup arrow may point. Valid values are `"up"`, `"down"`, `"left"`, `"right"`, or `"any"`. The default is `"any"`.
function media.selectPhoto(listener, mediaSource, destination, origin, permittedArrowDirections) end

---  Loads the event sound <nobr>(1-3 seconds)</nobr> from a sound file and returns an event sound ID that can be passed to [media.playEventSound()][api.library.media.playEventSound].  
--- @param audioFileName string The name of the audio file you want to load.
--- @param baseDir Constant? If specified, this argument is the directory where the sound file is located. If missing, the default is `system.ResourceDirectory`. Other options include:* `system.DocumentsDirectory`* `system.ApplicationSupportDirectory`* `system.TemporaryDirectory`* `system.CachesDirectory`
--- @return userdata
function media.newEventSound(audioFileName, baseDir) end

---  Determines if the given media source, such as a camera or photo library, is available on the platform. This function should be called before calling [media.selectPhoto()][api.library.media.selectPhoto] or [media.capturePhoto()][api.library.media.capturePhoto] to determine if that media service is available. Returns `true` if the media source is available on the platform/device. Returns `false` if not. 
--- @param mediaSource Constant Can be one of the following:* `media.PhotoLibrary`* `media.Camera`* `media.SavedPhotosAlbum`
--- @return boolean
function media.hasSource(mediaSource) end

---  Returns the current volume setting for playback of extended sounds ([media.playSound()][api.library.media.playSound]). 
--- @return number
function media.getSoundVolume() end

