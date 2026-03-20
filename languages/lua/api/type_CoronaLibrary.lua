---@meta

---This is the standard type for Corona libraries in Lua.``````lualocal Library = require "CoronaLibrary"-- Create librarylocal lib = Library:new{ name="mylibrary", publisherId="com.mycompany" }``````
---@class CoronaLibrary
---@field publisherId string
---@field name string
---@field version number
---@field revision number
local CoronaLibrary = {}

---  Returns the currently set provider for the library. 
--- @return CoronaProvider
---@param self any
function CoronaLibrary.getCurrentProvider(self) end

---  Sets the current provider for the library. 
--- @param provider CoronaProvider The library provider.
---@param self any
function CoronaLibrary.setCurrentProvider(self, provider) end

