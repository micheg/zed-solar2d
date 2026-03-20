---@meta

---Native display objects are separate from Corona's OpenGL drawing canvas and always appear in front of normal [display objects][api.type.DisplayObject].See the [native.*][api.library.native] library for a list of all native APIs.
---@class NativeDisplayObject: DisplayObject
local NativeDisplayObject = {}

---  This function allows you to __get__ properties of the underlying native object created by the [native][api.library.native] library. For example, if you create a [WebView][api.type.WebView] on iOS, you can access the <nobr>Obj-C</nobr> properties of the corresponding `WKWebView` (or `WKWebViewConfiguration` if called before a request is made). 
--- @param property string The string name for the native property.
---@param self any
function NativeDisplayObject.getNativeProperty(self, property) end

---  This function allows you to __set__ properties of the underlying native object created by the [native][api.library.native] library. For example, if you create a [WebView][api.type.WebView] on iOS, you can set the Obj-C properties of the corresponding [`WKWebView`](https://developer.apple.com/documentation/webkit/wkwebview?language=objc) or [`WKWebViewConfiguration`](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration?language=objc) if called before a request is made. Similarly on Android it can set properties of [`WebView`](https://developer.android.com/reference/android/webkit/WebView) or [`WebSettings`](https://developer.android.com/reference/android/webkit/WebSettings) 
--- @param property string The string name for the native property.
--- @param value boolean The value to set the property to. Must be a Lua value compatible with <nobr>Obj-C</nobr> or Java. The following Lua values are converted to the corresponding values in <nobr>Obj-C</nobr>: [boolean][api.type.Boolean], [string][api.type.String], [array][api.type.Array], [table][api.type.Table], and [number][api.type.Number]. Java supported types are [boolean][api.type.Boolean], [string][api.type.String] and [number][api.type.Number].Android also supports special pair of values for WebView: property `"http.agent"` and value `"system"` to set WebView user agent to system default.
---@param self any
function NativeDisplayObject.setNativeProperty(self, property, value) end

