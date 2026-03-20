---@meta

---Corona supports Lua's module functionality for creating and loading external libraries. You can create your own libraries and call them from your application.
---@class package
---@field loaded table
---@field loaders table
package = {}

---  Loads the given module.   The function starts by looking into the [package.loaded][api.library.package.loaded] table to determine whether `modname` is already loaded. If it is, `require()` returns the value stored at `package.loaded[modname]`. Otherwise, it tries to find a loader for the module.  To find a loader, `require()` is guided by the `package.loaders` array. By changing this array, you can change how `require()` looks for a module. The following explanation is based on the default configuration for `package.loaders`.  First, `require()` queries `package.preload[modname]`. If it has a value, this value (which should be a function) is the loader. Otherwise, `require()` searches for a Lua loader using the path stored in `package.path`. If that also fails, it tries an <nobr>all-in-one</nobr> loader (see&nbsp;[package.loaders][api.library.package.loaders]).  Once a loader is found, `require()` calls the loader with a single argument of `modname`. If the loader returns any value, `require()` assigns the returned value to `package.loaded[modname]`. If the loader returns no value and has not assigned any value to `package.loaded[modname]`, `require()` assigns `true` to this entry. In any case, `require()` returns the final value of `package.loaded[modname]`.  If there is any error loading or running the module, or if it cannot find any loader for the module, `require()` signals an error. 
--- @param moduleName string The name of the module to load. Do __not__ append the `.lua` extension to this string.
--- @return Library
function package.require(moduleName) end

