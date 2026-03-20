---@meta

---A native text field is a single-line input field for displaying <nobr>text-based</nobr> content. See [native.newTextField()][api.library.native.newTextField] for more details.
---@class TextField: NativeDisplayObject
---@field font userdata
---@field placeholder string
---@field isSecure boolean
---@field size number
---@field text string
---@field autocorrectionType string
---@field isFontSizeScaled boolean
---@field hasBackground boolean
---@field spellCheckingType string
---@field clearButtonMode string
---@field inputType string
---@field align string
local TextField = {}

---  Sets the return key value on the keyboard.  
--- @param key string The type name of the return button.
---@param self any
function TextField.setReturnKey(self, key) end

---  Returns the cursors first and last position. 
---@param self any
function TextField.getSelection(self) end

---  Changes the font size to "best fit" the current height of the text field. This will automatically occur when you first create a text field via the [native.newTextField()][api.library.native.newTextField] function. 
---@param self any
function TextField.resizeFontToFitHeight(self) end

---  Changes the height of the text field to "best&nbsp;fit" the font size that it's currently using. 
---@param self any
function TextField.resizeHeightToFitFont(self) end

---  Sets the color of the text in a native text input field. 
--- @param r number A value between `0` and `1` for red, green, and blue channels.
--- @param g number A value between `0` and `1` for red, green, and blue channels.
--- @param b number A value between `0` and `1` for red, green, and blue channels.
--- @param a number? A value between `0` and `1` for the alpha channel. Default is `1`. This can not be changed on Windows.
---@param self any
function TextField.setTextColor(self, r, g, b, a) end

---  Sets the cursor position if the start and end positions are the same. Alternatively, sets a range of selected text if the start and end positions are different. 
--- @param startPosition number The cursor position or the beginning of the selection area. To select the first character, this value should be `0`.
--- @param endPosition number The end of the selection area (if greater than `startPosition`). The last character will be used if this number is greater than the length of the current string in the text field.
---@param self any
function TextField.setSelection(self, startPosition, endPosition) end

