---@meta

---
---@class CoronaPrototype
local CoronaPrototype = {}

---  Objects based on [CoronaPrototype][api.type.CoronaPrototype] cannot have their `__index` metamethod overridden.  When called, `indexFunc` will be called prior to the original `__index` metamethod. If `indexFunc` returns `nil`, then the original metamethod is called. 
--- @param indexFunc function The index function.
---@param self any
function CoronaPrototype.setExtension(self, indexFunc) end

---  Constructor for creating new class objects. The `object` is assumed to be a [class][api.type.CoronaClass] object. 
--- @param name string The name of the class.
--- @return CoronaPrototype
---@param self any
function CoronaPrototype.newClass(self, name) end

---  Constructor for creating new object instances. The `object` is assumed to be a [class][api.type.CoronaClass] object. 
--- @param params table? Optional table of parameters which can be passed to `new()` and forwarded to `initialize()` which can be overridden by subclasses.
--- @return CoronaPrototype
---@param self any
function CoronaPrototype.new(self, params) end

---  Determines if `object` is an instance of `class`. 
--- @param class CoronaPrototype The class.
--- @return boolean
---@param self any
function CoronaPrototype.instanceOf(self, class) end

---  Subclasses can override this method to provide custom initialization of instances. 
---@param self any
function CoronaPrototype.initialize(self) end

---  Tells you whether `object` is really a class. 
--- @return boolean
---@param self any
function CoronaPrototype.isClass(self) end

---  Tells you whether `object` is the root class, i.e. [CoronaPrototype][api.type.CoronaPrototype]. 
--- @return boolean
---@param self any
function CoronaPrototype.isRoot(self) end

