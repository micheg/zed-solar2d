---@meta

---Timer functions allow calling a function some time in the future rather than immediately. The timer library provides the basic functions to let set up the timer and manage the event listener.
---@class timer
---@field allowIterationsWithinFrame boolean
timer = {}

---  Calls a specified function after a delay. This function returns a [table][api.type.Table] that can be used with other [timer][api.library.timer] functions. For example, the returned table can be passed to [timer.cancel()][api.library.timer.cancel] to cancel the invocation of the specified listener.  
--- @param delay number The delay in milliseconds, for example, `1000` = 1 second. Note that timers cannot execute faster than the runtime framerate of the app. For example, if the framerate of the app is `60` frames per second, as defined in the `config.lua` file \([guide][guide.basics.configSettings]\), the shortest delay for a timer is approximately `16.667` milliseconds <nobr>(`1000`/`60` = ~`16.667`)</nobr>.
--- @param listener Listener The listener to invoke after the delay. This may be either a function listener or a table listener. If a table listener, it must have a timer method because timer events are sent to the listener.
--- @param iterations number? Optionally specify the number of times `listener` is to be invoked. By default, it is `1`; pass `0` or `-1` if you want the timer to loop forever.
--- @param tag string? Optionally assign a `tag` to the timer. You can pause, resume or cancel all timers that share the same `tag` with a single function call. Note: Using `tag` requires `Solar2D 2020.3611` or a newer build.
--- @return table
function timer.performWithDelay(delay, listener, iterations, tag) end

---  Resumes a specific timer or all timers with the same tag that were paused with [timer.pause()][api.library.timer.pause].  If a specific timer is resumed, then the function returns a [number][api.type.Number] that represents the amount of time remaining in the timer. 
--- @param whatToResume table _[Object][api.type.Object] or [String][api.type.String]._ The timer ID from, or `tag` passed to, [timer.performWithDelay()][api.library.timer.performWithDelay]. Note: Using `tag` requires `Solar2D 2020.3611` or a newer build.
--- @return number
function timer.resume(whatToResume) end

---  Pauses a specific timer or all timers with the same tag that were started with [timer.performWithDelay()][api.library.timer.performWithDelay].  If a specific timer is paused, then the function returns a [number][api.type.Number] that represents the amount of time remaining, in milliseconds. 
--- @param whatToPause table _[Object][api.type.Object] or [String][api.type.String]._ The timer ID from, or `tag` passed to, [timer.performWithDelay()][api.library.timer.performWithDelay]. Note: Using `tag` requires `Solar2D 2020.3611` or a newer build.
--- @return number
function timer.pause(whatToPause) end

---  Cancels all timer operations initiated with [timer.performWithDelay()][api.library.timer.performWithDelay]. 
function timer.cancelAll() end

---  Resumes all timers that were paused with [timer.pause()][api.library.timer.pause].  
function timer.resumeAll() end

---  Pauses all timers started with [timer.performWithDelay()][api.library.timer.performWithDelay]. 
function timer.pauseAll() end

---  Cancels a specific timer or all timers with the same tag that were initiated with [timer.performWithDelay()][api.library.timer.performWithDelay].  <!---  This function returns two numbers: time remaining ( and number of iterations that were left.  --> 
--- @param whatToCancel table _[Object][api.type.Object] or [String][api.type.String]._ The timer ID from, or `tag` passed to, [timer.performWithDelay()][api.library.timer.performWithDelay]. Note: Using `tag` requires `Solar2D 2020.3611` or a newer build.
function timer.cancel(whatToCancel) end

