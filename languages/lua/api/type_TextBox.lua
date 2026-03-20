---@meta

---A native text box is a scrollable, <nobr>multi-line</nobr> input field for displaying <nobr>text-based</nobr> content. See [native.newTextBox()][api.library.native.newTextBox] for more details.
---@class TextBox: NativeDisplayObject
---@field font userdata
---@field isEditable boolean
---@field placeholder string
---@field align string
---@field size number
---@field text string
---@field hasBackground boolean
---@field isFontSizeScaled boolean
local TextBox = {}

---  Sets the return key value on the keyboard.  
--- @param key string The type name of the return button.
---@param self any
function TextBox.setReturnKey(self, key) end

---  Sets the color of the text in a native text input box. 
--- @param r number A value between `0` and `1` for red, green, and blue channels.
--- @param g number A value between `0` and `1` for red, green, and blue channels.
--- @param b number A value between `0` and `1` for red, green, and blue channels.
--- @param a number? A value between `0` and `1` for the alpha channel. Default is `1`. This can not be changed on Windows.
---@param self any
function TextBox.setTextColor(self, r, g, b, a) end

---  Returns the cursors first and last position. 
---@param self any
function TextBox.getSelection(self) end

---  Sets the cursor position if the start and end positions are the same. Alternatively, sets a range of selected text if the start and end positions are different. 
--- @param startPosition number The cursor position or the beginning of the selection area. To select the first character, this value should be `0`.
--- @param endPosition number The end of the selection area, if greater than `startPosition`. The last character will be used if this number is greater than the length of the current string in the text box.
---@param self any
function TextBox.setSelection(self, startPosition, endPosition) end

