---@meta

---The native library wraps platform-specific UI elements like input fields, maps, web views, and more. These are controlled/rendered by the OS, not the Corona engine.
---@class native
---@field systemFont Constant
---@field systemFontBold Constant
native = {}

---  Dismisses the currently displaying web popup. This function takes no arguments because only one web popup can be shown at one time (not to be confused with [native web views][api.library.native.newWebView] which can have multiple instances shown at once).  
function native.cancelWebPopup() end

---  Dismisses an alert box programmatically. For example, you may wish to have a popup alert that automatically disappears after ten seconds even if the user doesn't click it. In that case, you could call this function at the end of a timer. 
--- @param alert table The alert to cancel, returned from [native.showAlert()][api.library.native.showAlert].
function native.cancelAlert(alert) end

---  Sets a platform-specific property. 
function native.setProperty() end

---  Displays or hides a platform-specific activity indicator. Touch events are ignored while the indicator is shown.  Note that on Android, the activity indicator is shown as a popup dialog, while on iOS and macOS it's an overlay. For Win32 desktop apps, the mouse cursor changes to a "busy/waiting" cursor.  
--- @param state boolean Use `true` to show the indicator and `false` to hide it.
function native.setActivityIndicator(state) end

---  On Android, this closes the application window gracefully without terminating the process. On macOS and Windows, this closes the application.  It is highly recommended that you call this function instead of [os.exit()][api.library.os.exit]. The [os.exit()][api.library.os.exit] function call terminates the application process immediately, which can be interpretted by an app reviewer as a crash. It would also clear all scheduled notifications and notification in the status bar on Android, which require the application process to be alive in the background to manage them.  
function native.requestExit() end

---  Returns whether or not the popup type can be shown. This usually defines whether the popup will actually be displayed. However, in the case of `"appStore"`, a result of `true` does not guarantee that the popup will be displayed because, in those cases, the particular popup will depend on additional parameters.  
--- @param name string The string name of the popup to be shown. This can be one of the following:* `"mail"`* `"sms"`* `"appStore"`* `"requestAppPermission"`Note that there are also additional popup types available via plugins (see [native.showPopup()][api.library.native.showPopup]).
--- @return boolean
function native.canShowPopup(name) end

---  Creates a scrollable, __multi-line__ [TextBox][api.type.TextBox] object for text input. For <nobr>single-line</nobr> text input, see [native.newTextField()][api.library.native.newTextField].  By default, the content of text boxes is not editable. Set the [object.isEditable][api.type.TextBox.isEditable] property to `true` to make the content editable.  Native text boxes can listen for [userInput events][api.event.userInput] (see&nbsp;example).  
--- @param x number The __x__ coordinate that corresponds to the center of the text box.
--- @param y number The __y__ coordinate that corresponds to the center of the text box.
--- @param width number Width of the text box.
--- @param height number Height of the text box.
--- @return TextBox
function native.newTextBox(x, y, width, height) end

---  Creates a web popup that loads a local or remote web page. 
--- @param x number? The __x__ coordinate that corresponds to the left edge of the web popup.
--- @param y number? The __y__ coordinate that corresponds to the top edge of the web popup.
--- @param width number? Width of the web popup.
--- @param height number? Height of the web popup.
--- @param url string URL of the local or remote web page (including extension for a local URL). By default, the URL is assumed to be an absolute URL to a remote server. If `x`, `y`, `width`, `height` are not specified, the popup occupies the entire screen.
--- @param options table? Table containing additional parameters for the popup &mdash; see the next section for details.
---@overload fun (x:number, y:number, url:string, options:table?)
---@overload fun (x:number, y:number, width:number?, height:number?, url:string, options:table?)
---@overload fun (url:string, options:table?)
---@overload fun (url:string)
function native.showWebPopup(x, y, width, height, url, options) end

---  Returns an array of the available native fonts. 
--- @return Array
function native.getFontNames() end

---  Displays the operating system's default popup window for a specified service. Displaying this popup suspends the app on both iOS and Android.  This function returns `true` or `false` indicating whether the popup was displayed or not. If it returns `false`, then the popup was not available or the service was not available for the device.  
--- @param name string The string name of the popup to be shown. It can be one of the following:* `"mail"` &mdash; Displays a popup window for composing an email.* `"sms"` &mdash; Displays a popup window for composing an SMS message.* `"appStore"` &mdash; Displays a popup window from the app store that the application was downloaded from. It will display the app's details such as the summary, an option to purchase (if&nbsp;not already&nbsp;done), and an option to write a review. This can be used to display the details of the currently running app or another app that you wish to advertise to the user. Currently, these app stores are supported: iTunes&nbsp;App&nbsp;Store, Google&nbsp;Play, and Amazon&nbsp;App&nbsp;Store. If you pass in `"appStore"`, the iTunes&nbsp;App&nbsp;Store requires the `iOSAppId` to be set in the `options` table.* `"requestAppPermission"` &mdash; Displays a popup window for requesting an app permission.* `"activity"` &mdash; This setting pertains to the [Activity][plugin.CoronaProvider_native_popup_activity] plugin.* `"social"` &mdash; This setting pertains to the [Social][plugin.CoronaProvider_native_popup_social] plugin.* `"addressbook"` &mdash; This setting pertains to the [Address Book][plugin.CoronaProvider_native_popup_addressbook] plugin.* `"quickLook"` &mdash; This setting pertains to the [Quick Look][plugin.CoronaProvider_native_popup_quickLook] plugin.
--- @param options table? A table that specifies the optional properties for the popup — see the section below which corresponds to the `name` parameter.
--- @return boolean
function native.showPopup(name, options) end

---  Creates a __single-line__ [TextField][api.type.TextField] object for text input. For <nobr>multi-line</nobr> text input, see [native.newTextBox()][api.library.native.newTextBox].  The default font size of the text field depends on the field's height and is calculated to be the maximum font size that will fit inside the field, taking into account such things as <nobr>platform-specific</nobr> margins. The easiest way to create a text field is to set its height and let the font size be calculated automatically &mdash; however, note the first "gotcha" below.  Native text fields can listen for [userInput events][api.event.userInput] (see&nbsp;example).  Native text fields can display optional [placeholder][api.type.TextField.placeholder] text (`nil` by default). This can provide a "hint" as to what the user should enter in the field. If set, the placeholder string is displayed using the same style information (except&nbsp;the&nbsp;[text&nbsp;color][api.type.TextField.setTextColor]). The placeholder does not appear once actual text has been input into the field and it does not currently participate in determining the size of the text field.  
--- @param x number The __x__ coordinate that corresponds to the center of the text field.
--- @param y number The __y__ coordinate that corresponds to the center of the text field.
--- @param width number Width of the text field.
--- @param height number Height of the text field.
--- @return TextField
function native.newTextField(x, y, width, height) end

---  Gets the value of a platform-specific property. 
--- @param key string The property whose value will be retrieved. Supported keys include:* `"androidSystemUiVisibility"` &mdash; Android and Fire&nbsp;OS only.* `"applicationIconBadgeNumber"` &mdash; iOS only.* `"applicationSupportsShakeToEdit"` &mdash; iOS only.* `"networkActivityIndicatorVisible"` &mdash; iOS only.* `"prefersHomeIndicatorAutoHidden"` &mdash; iOS only.* `"windowMode"` &mdash; Applies only to macOS desktop and Win32 desktop apps.* `"windowTitleText"` &mdash; Applies only to macOS desktop and Win32 desktop apps.* `"mouseCursorVisible"` &mdash; Applies only to macOS desktop and Win32 desktop apps.* `"preferredScreenEdgesDeferringSystemGestures"` &mdash; iOS only.
function native.getProperty(key) end

---  Displays a popup alert box with one or more buttons, using a native alert control. Program activity, including animation, will continue in the background, but all other user interactivity will be blocked until the user selects a button or cancels the dialog. 
--- @param title string The title string displayed in the alert.
--- @param message string Message string displayed in the alert text.
--- @param buttonLabels table? Table of strings, each of which will create a button with the corresponding label. Include at least one `buttonLabel` or the dialog will not have any buttons. The maximum number of buttons in an alert box is five. The most common format is one or two buttons, for example `"OK"` and `"Cancel"`.
--- @param listener Listener? The listener function to be called when a user presses any button in the alert box. It can assign an action to each button according to its numerical index: the first button is index 1, the second is index 2, and so on. The listener can be either a function listener or a table listener and the event dispatched to the listener will have the following additional properties:* `event.action` represents how the alert was dismissed: `"cancelled"` indicates that [native.cancelAlert()][api.library.native.cancelAlert] was called to close the alert, while `"clicked"` indicates that the user clicked on a button to close the alert.* `event.index` is the index of the button pressed. It corresponds to the index in the `buttonLabels` parameter.
--- @return table
function native.showAlert(title, message, buttonLabels, listener) end

---  Sets keyboard focus on a [native.newTextField()][api.library.native.newTextField] or [native.newTextBox()][api.library.native.newTextBox] and shows (or&nbsp;hides) the keyboard. Pass `nil` to remove focus and hide the keyboard. Hiding the keyboard dispatches an `"ended"` [phase][api.event.userInput.phase] to the native object's listener function.  
--- @param textField table ID/reference of the text field/box on which to set the keyboard focus, or `nil` to hide the keyboard.
function native.setKeyboardFocus(textField) end

---  Sets the iCloud automatic backup flag for files in the `system.DocumentsDirectory` and `system.ApplicationSupportDirectory` on macOS and iOS systems.  The iCloud backup is `true` by default and must be set `false` with this API to disable automatic backup of files to iCloud.  This function returns up to two values:  * `value` ([Boolean][api.type.Boolean]) &mdash; `true` if synchronization was successful, `false` if it failed. Returns `nil` on Android and Windows systems since they don't support this API. * `errStr` ([String][api.type.String]) &mdash; Error message if `value` returned `false`. 
--- @param filename string Name of file (including path).
--- @param params table Set to `{ iCloudBackup = flag }` where `flag` is `true` to enable iCloud backup (default) or `false` to disable it.
--- @return boolean
function native.setSync(filename, params) end

---  Loads a web page in a web view container. This native web view can be moved via `x`/`y` properties in the same manner as other display objects. On iOS, you can also rotate it via the `rotation` property.  This API supports loading from either a local file containing HTML content (in&nbsp;one of the system directories) or from a remote website. 
--- @param x number The __x__ coordinate that corresponds to the center of the web view object.
--- @param y number The __y__ coordinate that corresponds to the center of the web view object.
--- @param width number Width of the web view object.
--- @param height number Height of the web view object.
--- @return WebView
function native.newWebView(x, y, width, height) end

---  Returns a video object that can be moved and rotated. This API supports local videos (in&nbsp;one of the system directories) or from a remote location (streaming). 
--- @param x number The __x__ coordinate that corresponds to the center of the video object.
--- @param y number The __y__ coordinate that corresponds to the center of the video object.
--- @param width number Width of the video object.
--- @param height number Height of the video object.
--- @return Video
function native.newVideo(x, y, width, height) end

---  Creates a font object that you can use to specify fonts in native text fields, native text boxes, and text display objects. 
--- @param name string _[String][api.type.String], [Userdata][api.type.Userdata], or [Constant][api.type.Constant]._ This can be one of the following:* The font family name (typeface name). You may obtain an array of available font names via [native.getFontNames()][api.library.native.getFontNames].* Name of the font file in the Corona project's main resource directory (alongside `main.lua`).* A font object returned by [native.newFont()][api.library.native.newFont].* A font constant such as [native.systemFont][api.library.native.systemFont] or [native.systemFontBold][api.library.native.systemFontBold].
--- @param size number? The point size of the font to use. By default, it will be the standard system font size of the device.
--- @return userdata
function native.newFont(name, size) end

---  Gets the iCloud automatic backup settings for files in the `system.DocumentsDirectory` and `system.ApplicationSupportDirectory` on macOS and iOS systems.  The iCloud backup is `true` by default and must be set `false` with the [native.setSync()][api.library.native.setSync] API to disable automatic backup of files to iCloud.  This function returns up to two values:  * `value` ([Boolean][api.type.Boolean]) &mdash; The `iCloudBackup` setting (`true` or `false`) for the specified file. You must check `errStr` to see if this API returned an error. Returns `nil` on Android and Windows systems since they do not support this API. * `errStr` ([String][api.type.String]) &mdash; Error message if `value` returned `false`. 
--- @param filename string Name of file (including path).
--- @param params table Table with the structure `{ key = "iCloudBackup" }`.
--- @return boolean
function native.getSync(filename, params) end

---  Renders a map view within the specified boundaries and returns a display object wrapper. On the map view, touch events are available when you add a [mapLocation][api.event.mapLocation] event listener. 
--- @param x number The __x__ coordinate that corresponds to the center of the map view object.
--- @param y number The __y__ coordinate that corresponds to the center of the map view object.
--- @param width number Width of the map view object.
--- @param height number Height of the map view object.
--- @return Map
function native.newMapView(x, y, width, height) end

