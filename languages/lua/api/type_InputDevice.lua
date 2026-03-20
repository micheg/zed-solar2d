---@meta

---An object of this type respresent one input device such as a keyboard, mouse, touchscreen, gamepad, etc. This object provides access to the input device's information and its current connection status.An input device object is normally provided with a [key][api.event.key] event, which allows an application to identify which device the input event came from. This is important for multiplayer games, allowing an application to associate input devices with a particular players.
---@class InputDevice: userdata
---@field allowsRotation boolean
---@field permanentId string
---@field type string
---@field reportsAbsoluteDpadValues boolean
---@field androidDeviceId number
---@field productName string
---@field isConnected boolean
---@field displayName string
---@field playerNumber number
---@field connectionState string
---@field driver string
---@field MFiProfile string
---@field canVibrate boolean
---@field descriptor string
local InputDevice = {}

---  Fetches information about all axis inputs available on the device. This information can be used to detect the device's capabilities, such as whether or not an analog joystick is available. 
---  Causes the input device to vibrate/rumble.  This is a feature that is typically only supported by gamepads. You can determine if the input device supports vibration feedback by reading its [canVibrate][api.type.InputDevice.canVibrate] property. 
