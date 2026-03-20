---@meta

---The transition library provides functions and methods to transition/tween display objects or display groups over a specific period of time. Library features include:* Ability to __pause__, __resume__, or __cancel__ a transition (or all transitions).* Ability to __tag__ several transitions by name and then pause, resume, or cancel all transitions sharing the same tag.* Ability to pause, resume, or cancel all transitions on an object-wide basis. For example, if you have applied a separate movement and fade transition to an object, this allows you to control both transitions at once.* 41 [easing][api.library.easing] methods which allow you to interpolate tweens across the transition time using methods such as quadratic, exponential, elastic, bounce, etc.* Various convenience methods such as `blink()`, `fadeIn()`, `fadeOut()`, `moveTo()`, `moveBy()`, etc.
---@class transition
---@field ignoreEmptyReference boolean
transition = {}

---  Fades an object to alpha of `1.0` over the specified time. 
--- @param target table Any object that behaves like a table, for example [display objects][api.type.DisplayObject].
--- @param params table A table that specifies the properties of the transition — see the next section for details.
--- @return table
function transition.fadeIn(target, params) end

---  The `transition.cancel()` function will cancel one of the following, depending on the passed parameter:  * All transitions in progress, when called with no parameters. * A specific transition, when called with a transition reference. * All transitions on a specific display object, when called with a display object reference. * All transitions with a specific tag, when called with a string parameter representing a tag.  
--- @param transitionReference any? The specific transition to cancel.
--- @param displayObject DisplayObject? The display object upon which all associated transitions will be cancelled.
--- @param tagName string? The tag name; all transitions with this tag will be cancelled.
function transition.cancel(transitionReference, displayObject, tagName) end

---  Blinks (glows) an object in and out over a specified time, repeating indefinitely. 
--- @param target table Any object that behaves like a table, for example [display objects][api.type.DisplayObject].
--- @param params table A table that specifies the properties of the transition — see the next section for details.
--- @return table
function transition.blink(target, params) end

---  The `transition.resumeAll()` function resumes all paused transitions.  Note: Using [transition.resumeAll()][api.library.transition.resumeAll] requires `Solar2D 2020.3611` or a newer build. 
function transition.resumeAll() end

---  Moves an object to the specified `x` and `y` coordinates over a specified time. 
--- @param target table Any object that behaves like a table, for example [display objects][api.type.DisplayObject].
--- @param params table A table that specifies the properties of the transition — see the next section for details.
--- @return table
function transition.moveTo(target, params) end

---  The `transition.resume()` function resumes one of the following, depending on the passed parameter:  * All paused transitions, when called with no parameters. * A specific paused transition, when called with a transition reference. * All paused transitions on a specific display object, when called with a display object reference. * All paused transitions with a specific tag, when called with a string parameter representing a tag.  
--- @param transitionReference any? The specific paused transition to resume.
--- @param displayObject DisplayObject? The display object upon which all associated transitions will be resumed.
--- @param tagName string? The tag name; all transitions with this tag will be resumed.
function transition.resume(transitionReference, displayObject, tagName) end

---  Moves an object to the specified `x` and `y` coordinates and back, creating a loop.  `time` is used for a full cycle and the easing is reversed in the second half of the transition. 
--- @param target table Any object that behaves like a table, for example [display objects][api.type.DisplayObject].
--- @param params table A table that specifies the properties of the transition — see the next section for details.
--- @return table
function transition.loop(target, params) end

---  The `transition.pauseAll()` function pauses all running transitions.  Note: Using [transition.pauseAll()][api.library.transition.pauseAll] requires `Solar2D 2020.3611` or a newer build.  
function transition.pauseAll() end

---  The `transition.pause()` function pauses one of the following, depending on the passed parameter:  * All transitions in progress, when called with no parameters. * A specific transition, when called with a transition reference. * All transitions on a specific display object, when called with a display object reference. * All transitions with a specific tag, when called with a string parameter representing a tag.  
--- @param transitionReference any? The specific transition to pause.
--- @param displayObject DisplayObject? The display object upon which all associated transitions will be paused.
--- @param tagName string? The tag name; all transitions with this tag will be paused.
function transition.pause(transitionReference, displayObject, tagName) end

---  The `transition.cancelAll()` function cancels all running and paused transitions.  Note: Using [transition.cancelAll()][api.library.transition.cancelAll] requires `Solar2D 2020.3611` or a newer build.  
function transition.cancelAll() end

---  Performs a dissolve transition between two display objects. 
--- @param object1 DisplayObject The initial display object.
--- @param object2 DisplayObject The final display object.
--- @param time number? Specifies the duration of the transition in milliseconds. By default, the duration is 500 milliseconds.
--- @param delay number? Specifies the delay, in milliseconds, before the transition begins. Default is `0`.
--- @return table
function transition.dissolve(object1, object2, time, delay) end

---  Fades an object to alpha of `0.0` over the specified time. 
--- @param target table Any object that behaves like a table, for example [display objects][api.type.DisplayObject].
--- @param params table A table that specifies the properties of the transition — see the next section for details.
--- @return table
function transition.fadeOut(target, params) end

---  Scales an object by the specified `xScale` and `yScale` amounts over a specified time. 
--- @param target table Any object that behaves like a table, for example [display objects][api.type.DisplayObject].
--- @param params table A table that specifies the properties of the transition — see the next section for details.
--- @return table
function transition.scaleBy(target, params) end

---  Animates (transitions) a [display object][api.type.DisplayObject] using an optional [easing][api.library.easing] algorithm. Use this to move, rotate, fade, or scale an object over a specific period of time.  This function returns a reference corresponding to the transition/animation of the object `target`.  Please see the [Transitions][guide.media.transitionLib] guide for usage information.  
--- @param target table Any object that behaves like a table, for example [display objects][api.type.DisplayObject].
--- @param params table A table that specifies the properties of the transition — see the next section for details.
--- @return table
function transition.to(target, params) end

---  Scales an object to the specified `xScale` and `yScale` amounts over a specified time. 
--- @param target table Any object that behaves like a table, for example [display objects][api.type.DisplayObject].
--- @param params table A table that specifies the properties of the transition — see the next section for details.
--- @return table
function transition.scaleTo(target, params) end

---  Moves an object by the specified `x` and `y` coordinate amount over a specified time. 
--- @param target table Any object that behaves like a table, for example [display objects][api.type.DisplayObject].
--- @param params table A table that specifies the properties of the transition — see the next section for details.
--- @return table
function transition.moveBy(target, params) end

---  Similar to [transition.to()][api.library.transition.to] except that the starting property values are specified in the parameters table and the final values are the corresponding property values of the object prior to the call. 
--- @param target table Any object that behaves like a table, for example [display objects][api.type.DisplayObject].
--- @param params table A table that specifies the properties of the transition. See [transition.to()][api.library.transition.to] for parameter references.
--- @return table
function transition.from(target, params) end

