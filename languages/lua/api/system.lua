---@meta

---Collectively, the system functions listed here return system information and control system functions — get device information, enable multitouch, control the idle time, accelerometer, GPS,&nbsp;etc.
---@class system
---@field CachesDirectory Constant
---@field orientation string
---@field TemporaryDirectory Constant
---@field ApplicationSupportDirectory Constant
---@field ResourceDirectory Constant
---@field DocumentsDirectory Constant
system = {}

---  Returns time in milliseconds since application launch. The fractional part of the returned value may return microseconds if the hardware supports it.  <div class="guide-notebox"> <div class="notebox-title">Notes</div>  * This value is unaffected by system clock changes and it always counts up. * This value will be affected (paused) when the app is suspended.  </div>  
--- @return number
function system.getTimer() end

---  Vibrates and haptic feedback on a phone. In the Corona Simulator, this will sound a system beep (macOS&nbsp;only). 
--- @param type string? The possible types are `"impact"`, `"selection"` and `"notification"`. If no value is specified the device will do a classic vibrate
--- @param style string? The possible styles for `"impact"` are `"light"`, `"medium"` and `"heavy"`. The default type is `"medium"`. The possible styles for `"notification"` are `"warning"`, `"success"` and `"error"`. The default type is `"success"`. 
function system.vibrate(type, style) end

------  Returns a new [EventDispatcher][api.type.EventDispatcher] that allows you to set up your own private event communications. Like the [Runtime][api.type.Runtime] and [DisplayObject][api.type.DisplayObject] types, this allows users of this [EventDispatcher][api.type.EventDispatcher] to add listeners to it and receive custom events dispatched via the [object:dispatchEvent()][api.type.EventDispatcher.dispatchEvent] function.   This API is intended for plugin developers who want to add their own custom functions similar to [Runtime:addEventListener()][api.type.EventDispatcher.addEventListener] and [Runtime:removeEventListener()][api.type.EventDispatcher.removeEventListener].  
--- @return EventDispatcher
function system.newEventDispatcher() end

---  Sets the frequency of [accelerometer][api.event.accelerometer] events.  On both Android and iOS, the default value is not documented but it is typically low, for example 10&nbsp;Hz.  <div class="docs-tip-outer docs-tip-color-alert"> <div class="docs-tip-inner-left"> <div class="fa fa-exclamation-circle" style="font-size: 35px;"></div> </div> <div class="docs-tip-inner-right">  Accelerometer events are a significant drain on the battery, so only increase the frequency when you need faster responses.  </div> </div>  
--- @param frequency number The measurement interval in Hz.
function system.setAccelerometerInterval(frequency) end

---  Generates an absolute path using system-defined directories as the base. An additional optional parameter, `baseDirectory`, specifies which base directory is used to construct the full path, with its default value being `system.ResourceDirectory`.  This function is intended for use with file I/O APIs, __not__ for display/media APIs that require a `baseDir` or `baseDirectory` parameter.  
--- @param filename string The name of the file, or a path to the file that is relative to `baseDirectory`. Alternatively, pass `nil` to get the path to `baseDirectory`.
--- @param baseDirectory Constant? Constant corresponding to the base directory where the file is located. Default value is [system.ResourceDirectory][api.library.system.ResourceDirectory] if the parameter is not provided.
--- @return string
function system.pathForFile(filename, baseDirectory) end

---  Sets the desired accuracy of [location (GPS)][api.event.location] events to distance in meters. Note: the actual accuracy depends on the capabilities of the device and/or platform. On the iPhone, accuracy is limited to discrete distances: < 10, 10, 100, 1000, and 3000 meters. Higher accuracy (smaller distances) requires more battery life, so use larger distance to preserve battery life. 
--- @param distance number Location accuracy in meters.
function system.setLocationAccuracy(distance) end

---  Deletes preferences from storage.  Returns `true` if __all__ of the given preferences were successfully deleted and no longer exist in storage. If a requested preference did not already exist in storage, it's still regarded as successfully deleted.   Returns `false` if at least one of the given preferences failed to be deleted from storage.  
--- @param category string Indicates which set of preferences should be accessed on the system. Currently, only the `"app"` category is supported&nbsp;&mdash; this is the application's custom preferences defined by the Corona app developer.
--- @param preferenceNames Array An array of [strings][api.type.String] indicating unique preference names to be deleted from storage.
--- @return boolean
function system.deletePreferences(category, preferenceNames) end

---  Controls whether the idle timer is enabled. If set to `true`, the timer will be active (default) or inactive if `false`. When active, the idle timer dims the screen and eventually puts the device to sleep when no user activity occurs. 
--- @param enabled boolean Pass `true` to enable the idle timer; `false` to disable it.
function system.setIdleTimer(enabled) end

---  Activates a system-level feature such as `"multitouch"`. Similarly, you can use [system.deactivate()][api.library.system.deactivate] to disable a feature.  <div class="docs-tip-outer"> <div class="docs-tip-inner-left"> <div class="fa fa-cog"></div> </div> <div class="docs-tip-inner-right">  Multitouch is disabled by default, so you must always initially activate it via this method.  </div> </div>  
--- @param feature string The system feature to be activated. Currently, the only supported values include:* `"multitouch"` &mdash; See the [Tap/Touch/Multitouch][guide.events.touchMultitouch] guide for more information.* `"controllerUserInteraction"` &mdash; See the [Apple TV / tvOS][guide.distribution.tvos] guide for more information.
function system.activate(feature) end

---  Writes a [table][api.type.Table] of preference values to storage. If any of the given preferences do not exist in storage, they will be inserted. If any of the given preferences already exist in storage, they will be overwritten.  Returns `true` if __all__ of the given preferences were written to storage successfully. Returns `false` if at least one of the given preferences failed to be written to storage.  
--- @param category string Indicates which set of preferences should be accessed on the system. Currently, only the `"app"` category is supported&nbsp;&mdash; this is the application's custom preferences defined by the Corona app developer.
--- @param preferences table Table of preferences to be written to storage. This table should contain <nobr>key-value</nobr> pairs where the key is the unique name of the preference and its value is either a [boolean][api.type.Boolean], [number][api.type.Number], or [string][api.type.String].
--- @return boolean
function system.setPreferences(category, preferences) end

---  Returns the requested preference's value.  
--- @param category string Indicates where to read preferences from. Must be set to one of the following:* `"app"` &mdash; The application's custom preferences. These are defined by the Corona app developer.* `"locale"` &mdash; Accesses the operating system's <nobr>read-only</nobr> <nobr>locale-related</nobr> preferences.* `"ui"` &mdash; Accesses the operating system's <nobr>read-only</nobr> <nobr>UI-related</nobr> preferences.
--- @param name string The unique name of the preference to read, depending on the category used:* `"app"` &mdash; A preference name written to storage by the Corona app developer via the [system.setPreferences()][api.library.system.setPreferences] function.* `"locale"` &mdash; Only supports preference names `"country"`, `"identifier"`, and `"language"`.* `"ui"` &mdash; Only supports preference name `"language"`.
--- @param type string? Indicates the value type to be returned by this function. This type should match the preference value's type on storage. For example, all preferences belonging to the `"locale"` and `"ui"` categories are stored as strings and should be read as strings, while types for the `"app"` category should match the value types passed to the [system.setPreferences()][api.library.system.setPreferences] function. Accepted values include:* `"string"` (default)* `"boolean"`* `"number"`
function system.getPreference(category, name, type) end

---  Returns an array of [InputDevice][api.type.InputDevice] devices that are currently connected to the system, such as a touchscreen, keyboard, mouse, joystick, etc. Alternatively returns an empty array if no input devices are found. Note that input devices which were once connected but were later disconnected will not be returned by this function.  This function is intended to be called on application start and application resume. During normal runtime, it's better to use the [inputDeviceStatus][api.event.inputDeviceStatus] event instead &mdash; this event is triggered when new input devices are connected to the system or when existing devices are disconnected.  
--- @return InputDevice
function system.getInputDevices() end

---  Sets the frequency of [gyroscope][api.event.gyroscope] events in Hz. Gyroscope events are a significant drain on battery, so only increase the frequency when you need faster responses.  
--- @param frequency number Sets the sample interval in Hertz (cycles per second), i.e. the number of measurements to take per second. If you set the frequency to 10, then the system will take 10 measurements per second.
function system.setGyroscopeInterval(frequency) end

---  Returns a [boolean][api.type.Boolean] value confirming whether a URL can be opened via [system.openURL()][api.library.system.openURL].  * Returns `true` if the URL can be opened. * Returns `false` if the URL is malformed or if there is no app to handle the URL's scheme. Also returns `false` on iOS&nbsp;9.0+ or tvOS if the URL is not listed in `LSApplicationQueriesSchemes` (see&nbsp;below).  <div class="guide-notebox"> <div class="notebox-title">Note</div>  If you are deploying the app for iOS&nbsp;9.0+ or&nbsp;tvOS, you must specify all of the associated URL schemes via the `LSApplicationQueriesSchemes` key within the `plist` table of `build.settings`. For instance, the following addition will allow the app to check if Facebook and Instagram URLs can be opened:  ``````lua settings = { 	iphone = 	{ 		plist = 		{ 			LSApplicationQueriesSchemes = { "fb", "instagram" }, 		}, 	}, } ``````  </div>  
--- @param url string The URL.
--- @return boolean
function system.canOpenURL(url) end

---  Returns a boolean `true` or `false` depending on whether the system delivers events corresponding to `eventName`.  
--- @param eventName string The name of the event source that delivers events of that name&nbsp;&mdash; see the next section for details.
--- @return boolean
function system.hasEventSource(eventName) end

---  Open a web page in the browser, create an email, or dial a phone number. Executing this function will close the app and switch to the <nobr>built-in</nobr> browser, email, or phone app.  You can check whether a URL can be opened via the [system.canOpenURL()][api.library.system.canOpenURL] function. 
--- @param url string One of the following:* Email address — `"mailto:nobody@mycompany.com"`, optionally including <nobr>URL-encoded</nobr> subject and body parameters, for example:<br/>`"mailto:nobody@mycompany.com?subject=Hi%20there&body=I%20just%20wanted%20to%20say%2C%20Hi!"`* Phone number — `"tel:123-456-7890"`* Web link — `"https://solar2d.com/"`
--- @return boolean
function system.openURL(url) end

------  The delay time between when a tap is detected and when the [tap][api.event.tap] event is delivered. By default, this time is 0.  This is useful for distinguishing between single tap and double tap events. Without a delay, all taps are interpreted as single tap events. 
--- @param delayTime number The delay time in seconds (__not__ milliseconds).
function system.setTapDelay(delayTime) end

---  Deactivates a system-level feature such as `"multitouch"`.  <div class="docs-tip-outer"> <div class="docs-tip-inner-left"> <div class="fa fa-cog"></div> </div> <div class="docs-tip-inner-right">  Multitouch is disabled by default, so there will be no effect unless it was previously activated via [system.activate()][api.library.system.activate].  </div> </div>  
--- @param feature string The system feature to be deactivated. Currently, the only supported values include:* `"multitouch"` &mdash; See the [Tap/Touch/Multitouch][guide.events.touchMultitouch] guide for more information.* `"controllerUserInteraction"` &mdash; See the [Apple TV / tvOS][guide.distribution.tvos] guide for more information.
function system.deactivate(feature) end

---  Returns information about the system on which the application is running. 
--- @param property string The name of the property corresponding to the desired information &mdash; see the reference lists below.
function system.getInfo(property) end

---  Sets how much distance in meters must be travelled until the next [location (GPS)][api.event.location] event is sent. Because location events involve hardware that can drain the battery, using larger threshold distances preserve battery life. 
--- @param distance number Location event distance (in meters). Defaults to 0 meters.
function system.setLocationThreshold(distance) end

---  Returns whether the application idle timer is enabled.   
--- @return boolean
function system.getIdleTimer() end

