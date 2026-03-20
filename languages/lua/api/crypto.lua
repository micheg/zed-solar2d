---@meta

---Corona provides routines for calculating common message digests (hashes) and hash-based message authentication codes (HMAC).
---@class crypto
---@field sha512 Constant
---@field sha384 Constant
---@field md5 Constant
---@field sha256 Constant
---@field sha1 Constant
---@field md4 Constant
---@field sha224 Constant
local crypto = {}

---  Computes HMAC (Key-Hashing for Message Authentication Code) of the string and returns it. 
--- @param algorithm Constant A constant specifying the hashing algorithm (see __Constants__ for [crypto.*][api.library.crypto]).
--- @param data string The input string.
--- @param key string String to use as the seed for the HMAC generation.
--- @param raw boolean? Indicates whether the output should be a direct binary equivalent of the message digest. If `false` (default), the result is formatted as a hexadecimal string.
--- @return string
function crypto.hmac(algorithm, data, key, raw) end

---  Generates the message digest (the hash) of the input string. 
--- @param algorithm Constant A constant specifying the hashing algorithm (see __Constants__ for [crypto.*][api.library.crypto]).
--- @param data string The input string.
--- @param raw boolean? Indicates whether the output should be a direct binary equivalent of the message digest. If `false` (default), the result is formatted as a hexadecimal string.
--- @return string
function crypto.digest(algorithm, data, raw) end

return crypto
