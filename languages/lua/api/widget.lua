---@meta

---
---@class widget
local widget = {}

---  Creates a [SegmentedControlWidget][api.type.SegmentedControlWidget] object.  
---@class NewSegmentedControlOptions
--- @field id string? An optional identification to assign to the segmented control. Default is `widget_segmentedControl`.
--- @field x number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field y number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field left number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field top number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field segmentWidth number? The width of each segment in pixels (all segments must be of equal width). Default is `50`.
--- @field segments table Table of comma-separated strings which defines the total segment count and the label that appears on each. For example:``````luasegments = { "Item 1", "Item 2", "Item 3", "Item 4" }``````
--- @field defaultSegment number? The segment that will be active upon the initial creation. Default is the first segment.
--- @field onPress Listener? An optional function to be called when a segment is pressed. The callback function does not require testing for `event.phase` since it only honors `began`.


--- @param NewSegmentedControlOptions NewSegmentedControlOptions
--- @return SegmentedControlWidget
function widget.newSegmentedControl(NewSegmentedControlOptions) end

---  Creates a [PickerWheelWidget][api.type.PickerWheelWidget] object.  
---@class NewPickerWheelOptions
--- @field id string? An optional identification to assign to the picker wheel. Default is `widget_pickerWheel`.
--- @field x number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field y number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field left number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field top number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field columns table A table which contains a sub-table for each individual column within the picker wheel. See [Configuring&nbsp;Columns](#columnconfig) below.
--- @field style string? Indicates the picker wheel construction style. If set to `"resizable"`, construction will adhere to the design outlined in [Resizable Construction](#resizable) below. If omitted, construction will adhere to a fixed size of 320&times;222.
--- @field onValueSelected Listener? Optional listener function which is triggered when the user selects an item in the picker wheel, or upon calling [object:selectValue()][api.type.PickerWheelWidget.selectValue].


--- @param NewPickerWheelOptions NewPickerWheelOptions
--- @return PickerWheelWidget
function widget.newPickerWheel(NewPickerWheelOptions) end

---  Use this function to set the overall theme of the widget library. This should be called immediately after you `require()` the widget library.  
--- @param theme string The theme name. Valid options include:* `"widget_theme_android_holo_dark"`* `"widget_theme_android_holo_light"`* `"widget_theme_ios7"`* `"widget_theme_android"` (legacy)* `"widget_theme_ios"` (legacy)
function widget.setTheme(theme) end

---  Creates a [ProgressViewWidget][api.type.ProgressViewWidget] object.  
---@class NewProgressViewOptions
--- @field id string? An optional identification to assign to the progress view. Default is `widget_progressView`.
--- @field x number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field y number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field left number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field top number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field width number The overall width of the progress view.
--- @field isAnimated boolean? Set this to `true` if the progress change should be animated, `false` (or&nbsp;omitted) if the progress change should occur instantly.
--- @field fillXOffset number? Set this to horizontally offset the fill region of the progress view. Default is `0`.
--- @field fillYOffset number? Set this to vertically offset the fill region of the progress view. Default is `0`.


--- @param NewProgressViewOptions NewProgressViewOptions
--- @return ProgressViewWidget
function widget.newProgressView(NewProgressViewOptions) end

---  Creates a [SwitchWidget][api.type.SwitchWidget] object. 
--- @param id string? An optional identification to assign to the switch. Default is `"widget_switch"`.
--- @param x number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @param y number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @param left number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @param top number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @param initialSwitchState boolean? The initial state of the switch &mdash; `true` for on/selected or `false` for off/deselected. Default is `false`.
--- @param style string? The switch style. Valid options are `"radio"`, `"checkbox"` and `"onOff"`. Default is `"onOff"`.
--- @param onPress Listener? An optional function to be called when the switch is pressed. The callback function does not require testing for `event.phase` since it only honors `"began"`. When reading the [object.isOn][api.type.SwitchWidget.isOn] property via this listener type, the current state of the switch is reported, meaning its `.isOn` state __before__ the actual switch state change occurs.
--- @param onRelease Listener? An optional function to be called when the user releases the switch (assuming the touch is still over the switch). The callback function does not require testing for `event.phase` since it only honors `"ended"`. When reading the [object.isOn][api.type.SwitchWidget.isOn] property via this listener type, the resulting state of the switch is reported, meaning its `.isOn` state __after__ the switch state change occurs.
--- @param onEvent Listener? An optional function that should only be specified if `onPress` and `onRelease` are not set. This callback function allows you to test for the `event.phase` of `"began"`, `"moved"`, or `"ended"`.
--- @return SwitchWidget
function widget.newSwitch(id, x, y, left, top, initialSwitchState, style, onPress, onRelease, onEvent) end

---  Creates a [TabBarWidget][api.type.TabBarWidget] object.  
---@class NewTabBarOptions
--- @field id string? An optional identification to assign to the tab bar. Default is `widget_tabBar`.
--- @field x number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field y number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field left number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field top number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field width number? The width and height of the tab bar, in pixels. The default height is `52`.
--- @field height number? The width and height of the tab bar, in pixels. The default height is `52`.
--- @field buttons table A table that contains sub-tables of parameters/options for the individual tabs that span the bar. Please see [Configuring&nbsp;Tab&nbsp;Buttons](#buttons) below.


--- @param NewTabBarOptions NewTabBarOptions
--- @return TabBarWidget
function widget.newTabBar(NewTabBarOptions) end

---  Creates a [SpinnerWidget][api.type.SpinnerWidget] object.  
--- @param id string? An optional identification to assign to the spinner. Default is `widget_spinner`.
--- @param x number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @param y number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @param left number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @param top number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @param width number? The width and height of each frame from the [image&nbsp;sheet][api.library.graphics.newImageSheet]. If you are using the default theme, these values are set automatically.
--- @param height number? The width and height of each frame from the [image&nbsp;sheet][api.library.graphics.newImageSheet]. If you are using the default theme, these values are set automatically.
--- @return SpinnerWidget
function widget.newSpinner(id, x, y, left, top, width, height) end

---  Creates a [TableViewWidget][api.type.TableViewWidget] object.  
--- @param id string? An optional identification string to assign to the table view. Default is `widget_tableView`.
--- @param x number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @param y number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @param left number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @param top number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @param width number? The width and height of the table view.
--- @param height number? The width and height of the table view.
--- @param friction number? Determines how fast the content travels when it is flicked up or down. The default value is `0.972`.
--- @param maxVelocity number? Limits the maximum scrolling speed of the table view. The default value is `2`.
--- @param isLocked boolean? If set to `true`, the table view will be locked, meaning it cannot be scrolled vertically.
--- @param isBounceEnabled boolean? If set to `false`, the table view will simply stop scrolling when it reaches the upper or lower limit. Default is `true`.
--- @param rowTouchDelay number? Specifies the delay, in milliseconds, until the row touch event is propagated. Default is `110` milliseconds.
--- @param onRowRender Listener? The function used to listen for [TableViewWidget][api.type.TableViewWidget] row rendering events. This function is called when a row is added via [object:insertRow()][api.type.TableViewWidget.insertRow], when all visible rows are <nobr>re-rendered</nobr> via [object:reloadData()][api.type.TableViewWidget.reloadData], or when an <nobr>off-screen</nobr> row moves back on screen. In this function, `event.row` is a reference to the row that was rendered.
--- @param onRowTouch Listener? The function used to listen for [TableViewWidget][api.type.TableViewWidget] touch/tap events. In this listener function, the `event.phase` values include `"tap"`, `"press"`, `"release"`, `"swipeLeft"`, and `"swipeRight"`. In addition, `event.target` is a reference to the row that was interacted with and `event.target.index` is the index number of that row.
--- @param listener Listener? The function used to listen for [TableViewWidget][api.type.TableViewWidget] touch/scroll events. In this listener function, `event.phase` returns the expected touch interaction phases of `"began"`, `"moved"`, or `"ended"`. In addition, a `"stopped"` phase can be detected when the table view flick/swipe momentum naturally comes to a stop. Finally, the scroll limit in either direction can be detected by `event.limitReached`. If this occurs, `event.direction` returns either `"up"` or `"down"` depending on the direction the table view was moving when the limit was reached.
--- @return TableViewWidget
function widget.newTableView(id, x, y, left, top, width, height, friction, maxVelocity, isLocked, isBounceEnabled, rowTouchDelay, onRowRender, onRowTouch, listener) end

---  Creates a [ButtonWidget][api.type.ButtonWidget] object.  
--- @param id string? An optional identification string to assign for the button. Default is `widget_button`.
--- @param x number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @param y number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @param left number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @param top number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @param isEnabled boolean? If `false`, the button will not respond to touch events. Use [button:setEnabled()][api.type.ButtonWidget.setEnabled] to enable or disable touch events on a button after creation. Default is `true` (button&nbsp;is&nbsp;enabled).
--- @param onPress Listener? An optional function to be called when the button is pressed. The callback function does not require testing for `event.phase` since it only honors `"began"`.
--- @param onRelease Listener? An optional function to be called when the user releases the button (assuming the touch is still over the button). The callback function does not require testing for `event.phase` since it only honors `"ended"`.
--- @param onEvent Listener? An optional function that should only be specified if `onPress` and `onRelease` are not set. This callback function allows you to test for the `event.phase` of `"began"`, `"moved"`, or `"ended"`.
--- @return ButtonWidget
function widget.newButton(id, x, y, left, top, isEnabled, onPress, onRelease, onEvent) end

---  Creates a [SliderWidget][api.type.SliderWidget] object.  
---@class NewSliderOptions
--- @field id string? An optional identification to assign to the slider. Default is `"widget_slider"`.
--- @field x number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field y number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field left number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field top number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field orientation string? The orientation of the slider, either `"horizontal"` or `"vertical"`. Default is `"horizontal"`.
--- @field width number The width __or__ height of the slider, depending on the `orientation` setting (`width` for horizontal or `height` for vertical).
--- @field height number The width __or__ height of the slider, depending on the `orientation` setting (`width` for horizontal or `height` for vertical).
--- @field value number? Represents the starting value of the slider, as a percentage. Default is `50`, meaning that the slider handle will begin at 50%.
--- @field listener Listener? The function which is called to handle slider interaction events. In this listener function, `event.phase` returns the expected touch interaction phases of `"began"`, `"moved"`, or `"ended"`. In addition, you can read the new value of the slider with `event.value`.


--- @param NewSliderOptions NewSliderOptions
--- @return SliderWidget
function widget.newSlider(NewSliderOptions) end

---  Creates a [StepperWidget][api.type.StepperWidget] object. The stepper consists of a minus and plus button which can be tapped or held down to decrement/increment a value, for example, the music or sound volume setting in a game. 
--- @param id string? An optional identification to assign to the stepper. Default is `widget_stepper`.
--- @param x number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @param y number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @param left number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @param top number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @param width number? The width and height of each frame from the [image&nbsp;sheet][api.library.graphics.newImageSheet]. Set these only if you are using a custom image sheet for the stepper. If you are using the default theme, these values are set automatically.
--- @param height number? The width and height of each frame from the [image&nbsp;sheet][api.library.graphics.newImageSheet]. Set these only if you are using a custom image sheet for the stepper. If you are using the default theme, these values are set automatically.
--- @param initialValue number? The initial value at which the stepper begins. Default is `0`.
--- @param minimumValue number? The minimum value that the stepper can reach. Default is `0`.
--- @param maximumValue number? The maximum value that the stepper can reach. Default is no limit.
--- @param timerIncrementSpeed number? The initial speed at which each stepper increment occurs, in milliseconds. Default is `1000`. The number of increments at which the speed change occurs can be controlled via `changeSpeedAtIncrement`.
--- @param changeSpeedAtIncrement number? The number of increments at which the increment speed changes. Default is `5`. The increment speed can be controlled via `timerIncrementSpeed`.
--- @param onPress Listener? An optional function to be called as soon as a stepper segment is pressed and held. This callback function returns the following `event.phase` events: `increment`, `decrement`, `minLimit`, and `maxLimit`.
--- @return StepperWidget
function widget.newStepper(id, x, y, left, top, width, height, initialValue, minimumValue, maximumValue, timerIncrementSpeed, changeSpeedAtIncrement, onPress) end

---  Creates a [ScrollViewWidget][api.type.ScrollViewWidget] object.  
---@class NewScrollViewOptions
--- @field id string? An optional identification string to assign to the scroll view. Default is `widget_scrollView`.
--- @field x number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field y number? Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.
--- @field left number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field top number? The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.
--- @field width number The visible (on&nbsp;screen) width and height of the scroll view.
--- @field height number The visible (on&nbsp;screen) width and height of the scroll view.
--- @field scrollWidth number? The width and height of the total scrollable content area. This can be changed after the scroll view widget has been created via the [object:setScrollWidth()][api.type.ScrollViewWidget.setScrollWidth] and [object:setScrollHeight()][api.type.ScrollViewWidget.setScrollHeight] methods. Note that these values automatically update when you insert objects into the scroll view.
--- @field scrollHeight number? The width and height of the total scrollable content area. This can be changed after the scroll view widget has been created via the [object:setScrollWidth()][api.type.ScrollViewWidget.setScrollWidth] and [object:setScrollHeight()][api.type.ScrollViewWidget.setScrollHeight] methods. Note that these values automatically update when you insert objects into the scroll view.
--- @field friction number? Determines how fast the content travels when it is flicked. The default value is `0.972`.
--- @field horizontalScrollDisabled boolean? If set to `true`, the scroll view will not scroll horizontally.
--- @field verticalScrollDisabled boolean? If set to `true`, the scroll view will not scroll vertically.
--- @field isLocked boolean? If set to `true`, the scroll view will be locked, meaning it cannot be scrolled.
--- @field isBounceEnabled boolean? If set to `false`, the bounce effect at the limits of the scrolling will be disabled. Default is `true`.
--- @field listener Listener? The function used to listen for [ScrollViewWidget][api.type.ScrollViewWidget] motion/scroll events. In this listener function, `event.phase` returns the expected touch interaction phases of `"began"`, `"moved"`, or `"ended"`. In addition, a `"stopped"` phase can be detected when the scroll view flick/swipe momentum naturally comes to a stop. Finally, the scroll limit in any direction can be detected by `event.limitReached`. If this occurs, `event.direction` returns the direction in which the scroll view was moving when the limit was reached.


--- @param NewScrollViewOptions NewScrollViewOptions
--- @return ScrollViewWidget
function widget.newScrollView(NewScrollViewOptions) end

return widget
