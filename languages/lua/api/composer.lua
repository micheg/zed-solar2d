---@meta

---Composer is the official scene (screen) creation and management library in CORONA_CORE_PRODUCT. This library provides developers with an easy way to create and transition between individual scenes.The primary object in the Composer library is the `scene` object. This is an event listener that responds to specific events, and it contains a unique `self.view` property which is a reference to the [display&nbsp;group][api.type.GroupObject] associated with the scene. This `self.view` is where you should insert visual elements pertaining to the scene.See the [Scene&nbsp;Template](#template) section below for an example of how a scene file might be structured. For more information on scene events, including names and dispatch order, see the [scene&nbsp;events][api.event.scene] documentation.
---@class composer
---@field stage DisplayObject
---@field recycleAutomatically boolean
---@field recycleOnLowMemory boolean
---@field recycleOnSceneChange boolean
---@field isDebug boolean
local composer = {}

---  This function loads an overlay scene above the currently active scene&nbsp;&mdash; <nobr>the "parent" scene &mdash;</nobr> leaving the parent scene intact.  When an overlay is shown, an overlay-specific scene `event` parameter, [event.parent][api.event.scene.show.parent], will be dispatched to the overlay scene. This parameter provides you with a reference to the parent scene object so that you may call functions/methods within it. See the [composer.hideOverlay()][api.library.composer.hideOverlay] documentation for a usage example.  This function supports all scene transition effects available for use with [composer.gotoScene()][api.library.composer.gotoScene].  To prevent touches on the overlay scene from passing through to underlying objects like buttons and widgets, set the `isModal` option to `true`.  
--- @param sceneName string The name of the scene to load as an overlay.
--- @param options table? This table contains several transition-related options such as the effect type, custom parameters, etc. See the [Overlay&nbsp;Options](#options) for the acceptable format of this table.<a id="options"></a>
function composer.showOverlay(sceneName, options) end

---  This function hides/removes the current overlay scene (see [composer.showOverlay()][api.library.composer.showOverlay]), if one is being displayed.  When an overlay is hidden, an overlay-specific scene `event` parameter, [event.parent][api.event.scene.hide.parent], will be dispatched to the overlay scene. This parameter provides you with a reference to the parent scene object so that you may call functions/methods within it. See the [Example](#examples) section for a usage case.  
--- @param recycleOnly boolean? If set to `true`, the scene will only be recycled (the `self.view` display group will be removed, but the scene object will remain in memory). Setting this to `true` is useful if you intend to show the overlay again in the near future. Default is `false`, meaning that the overlay scene will be completely removed, including its scene object. 
--- @param effect string? The visual transition effect applied to the overlay before it is hidden. A list of transition effects can be seen in the [composer.gotoScene()][api.library.composer.gotoScene] documentation.
--- @param time number? The time duration for the effect, if a valid effect has been specified. Default is `500` milliseconds.<a id="examples"></a>
function composer.hideOverlay(recycleOnly, effect, time) end

---  Returns the specified scene object, as returned from [composer.newScene()][api.library.composer.newScene]. Returns `nil` if the scene object does not exist. This function is useful for getting a reference to a specific scene object &mdash; for instance, if the current scene needs access to a specific function that's attached to another scene. 
--- @param sceneName string The name of the scene object.
--- @return table
function composer.getScene(sceneName) end

---  This function removes the specified scene (or optionally recycles it). A [destroy][api.event.scene.destroy] event is first dispatched to the scene.  To recycle the scene instead of removing it entirely, you may set the `shouldRecycle` parameter to `true` &mdash; this means that the scene's `self.view` display group will be removed, but its scene object will remain in memory. This may improve loading time if you access the scene frequently. If `shouldRecycle` is omitted or set to `false` (default), the scene will be removed entirely, including its scene object.  
--- @param sceneName string The name of the scene to recycle or remove. For instance, if you want to recycle or remove `scene1.lua`, pass `"scene1"` as this parameter.
--- @param shouldRecycle boolean? If the scene should be recycled, but not removed entirely, set this parameter to `true`. Default is `false`.
function composer.removeScene(sceneName, shouldRecycle) end

---  This function sets a variable within the Composer module which you can access from any other scene via  [composer.getVariable()][api.library.composer.getVariable]. 
--- @param variableName string The name of the variable to set.
--- @param value string The value to assign to the variable.
function composer.setVariable(variableName, value) end

---  Returns the current, previous, or overlay scene name as a string. This can then be used with [composer.gotoScene()][api.library.composer.gotoScene] or [composer.removeScene()][api.library.composer.removeScene]. 
--- @param sceneType string The name of the scene you want to retrieve. Possible values are `"current"`, `"previous"`, or `"overlay"`.
--- @return string
function composer.getSceneName(sceneType) end

---  Retrieves the value of a variable from within the Composer module that was previously set via [composer.setVariable()][api.library.composer.setVariable]. 
--- @param variableName string The name of the variable previously set via [composer.setVariable()][api.library.composer.setVariable].
function composer.getVariable(variableName) end

---  This function is used to transition to a specific scene. When called, the [hide][api.event.scene.hide] event is dispatched to the current scene (if&nbsp;one&nbsp;exists). If a `self.view` group does not already exist for the specified target scene, the [create][api.event.scene.create] event will be dispatched to that scene, then the [show][api.event.scene.show] event will be dispatched.  
--- @param sceneName string The name of the scene to go to. In many cases, this is the name of the scene's Lua file (without&nbsp;the `.lua`&nbsp;extension).
--- @param options table? This table contains several transition-related options such as the effect type, custom parameters, etc. See the [Scene&nbsp;Options](#options) for the acceptable format of this table.<a id="options"></a>
function composer.gotoScene(sceneName, options) end

---  This function creates new scene objects which can be used with the [Composer Library][guide.system.composer].  
--- @return table
function composer.newScene() end

---  Loads the specified scene, hidden behind the current scene, without initiating a scene transition. This function is similar to [composer.gotoScene()][api.library.composer.gotoScene], but it does not change the currently active scene. Only the [create][api.event.scene.create] event will be dispatched on the scene, assuming its `self.view` does not already exist.  In addition, you can set an optional `doNotLoadView` flag when calling this function. Doing so will load only the scene's object, not its `self.view` display group.  This function is commonly used to "pre-load" a scene before initiating a transition on it, which would happen explicitly at a later time. 
--- @param sceneName string The name of the scene to load, hidden behind the current scene.
--- @param doNotLoadView boolean? Set to `true` to load only the scene's object, not its `self.view` display group. Only the [create][api.event.scene.create] event will be dispatched on the scene, assuming its `self.view` does not already exist.
--- @param params table? An optional table containing any kind of custom data that should be transferred to the scene. In the specified scene, this data can be accessed via `event.params` in the [create][api.event.scene.create] event, unless `doNotLoadView` is set to `true`).
function composer.loadScene(sceneName, doNotLoadView, params) end

---  This function removes (or optionally recycles) all scenes __except__ for the currently active scene. A [destroy][api.event.scene.destroy] event is first dispatched to all of these scenes.  To recycle the scenes instead of removing them entirely, you may set the `shouldRecycle` parameter to `true` &mdash; this means that each scene's `self.view` display group will be removed, but their scene objects will remain in memory. If `shouldRecycle` is omitted or set to `false` (default), the scenes will be removed entirely, including their scene objects.  
--- @param shouldRecycle boolean? If the scenes should be recycled, but not removed entirely, set this parameter to `true`. Default is `false`.
function composer.removeHidden(shouldRecycle) end

return composer
