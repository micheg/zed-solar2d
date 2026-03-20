---@meta

---A web view object is a [native display object][api.type.NativeDisplayObject] associated with [native.newWebView()][api.library.native.newWebView].
---@class WebView: NativeDisplayObject
---@field hasBackground boolean
---@field canGoBack boolean
---@field canGoForward boolean
local WebView = {}

---  Takes the webView back one step in the [WebView][api.type.WebView] history. 
---@param self any
function WebView.back(self) end

---  Reloads the currently loaded page in a [WebView][api.type.WebView]. 
---@param self any
function WebView.reload(self) end

---  Stops loading the current page in the [WebView][api.type.WebView] (if loading). 
---@param self any
function WebView.stop(self) end

---  Deletes cookies for the [WebView][api.type.WebView]. 
---@param self any
function WebView.deleteCookies(self) end

---  Takes the [WebView][api.type.WebView] forward one step in its history. 
---@param self any
function WebView.forward(self) end

---  Loads the specified URL (string) into the [WebView][api.type.WebView]. For local content, you must specify a base [system][api.library.system] directory as a search path. 
--- @param url string The URL to load. For local files, this is a path relative to `baseDir`.
--- @param baseDir Constant? A base directory constant.
---@param self any
function WebView.request(self, url, baseDir) end

