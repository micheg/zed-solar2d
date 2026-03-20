---@meta

---
---@class graphics
graphics = {}

---  This function allows you to extend Corona and define a custom shader effect. Your custom effect can define either a vertex kernel or a fragment kernel (or&nbsp;both). These kernels are similar to shaders, except that they must define functions with a specific name and which conform to specific function signatures.   See the [Custom Shader Effects][guide.graphics.customEffects] guide for a detailed explanation of how to write shader code for these kernels.  <div class="guide-notebox-imp"> <div class="notebox-title-imp">Note</div>  Custom effects are supported on iOS, Android, macOS&nbsp;desktop, and Win32&nbsp;desktop.  </div>  
--- @param effect table Table which defines a shader effect &mdash; see the next section for details.
function graphics.defineEffect(effect) end

---  Creates a bit mask from an image file. The image is converted internally to grayscale. The white pixels of the bit mask allow the covered image to be visible, while black pixels hide (mask) the covered image. The area outside of the mask must be filled with black pixels which mask off the area outside the mask image.  The function returns a [Mask][api.type.Mask] object that can be applied to any display object using [object:setMask()][api.type.DisplayObject.setMask].  For a walkthrough on how to use image masks, see the [Masking Images][guide.media.imageMask] guide.  
--- @param filename string The name of the image file to create the mask from.
--- @param baseDir Constant? Specifies the directory path that contains the mask image. Can be one of the following:* `system.ResourceDirectory` (default)* `system.DocumentsDirectory`* `system.ApplicationSupportDirectory`* `system.TemporaryDirectory`* `system.CachesDirectory`
--- @return Mask
function graphics.newMask(filename, baseDir) end

---  This function produces the outline of the shape obtained from an image file or a frame within an [ImageSheet][api.type.ImageSheet]. A shape is recognized by the image's <nobr>non-transparent</nobr> alpha value. Generally, simpler images produce better outlines.  The returned value is a table of __x__ and __y__ coordinates in content space that can be used as the outline for the [physics.addBody()][api.library.physics.addBody] function 
--- @param coarsenessInTexels number The coarseness in texels. Higher values produce lower resolution outlines. Lower values produce larger outlines that can hurt performance.
--- @param imageFile string The file name of the image to trace.
--- @param baseDir Constant? Path to load the image from. Default is `system.ResourceDirectory` (project folder; same location as `main.lua`). See [system.pathForFile()][api.library.system.pathForFile] for valid values).
--- @return table
function graphics.newOutline(coarsenessInTexels, imageFile, baseDir) end

--- @param coarsenessInTexels number The coarseness in texels. Higher values produce lower resolution outlines. Lower values produce larger outlines that can hurt performance.
--- @param imageSheet ImageSheet Reference to an image sheet object created with [graphics.newImageSheet()][api.library.graphics.newImageSheet].
--- @param frameIndex number Represents the frame index number within the [ImageSheet][api.type.ImageSheet] to create the object from. This is only required if `imageSheet` is specified.
--- @return table
function graphics.newOutline(coarsenessInTexels, imageSheet, frameIndex) end

---  This convenience function disposes/releases all [TextureResource][api.type.TextureResource] objects of a specific [type][api.type.TextureResource.type].  
--- @param params table? Table containing the parameters for the [TextureResource][api.type.TextureResource] object(s) to be released — see the next section for details.
--- @return TextureResource
function graphics.releaseTextures(params) end

---  [ImageSheet][api.type.ImageSheet] objects, sometimes referred to as sprite sheets or texture atlases, allow you to load multiple images from a single image file. Image sheets must be used for [animated sprites][api.library.display.newSprite] and they can also be used to preload many static images. 
--- @param filename string This is the filename of the image file that includes all frames of the image sheet. This file is also called a "sprite sheet" image.
--- @param baseDir Constant? Specifies the base directory where `filename` is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.
--- @param options table Table with keys that represent specific options related to the resulting image sheet &mdash; see the next section for details.
--- @return ImageSheet
---@overload fun (filename:string, options:table):ImageSheet
function graphics.newImageSheet(filename, baseDir, options) end

---  This function calculates and returns the various metrics for the font with the given name (file&nbsp;name) and text size. The returned value is a [table][api.type.Table] containing the following properties:  * `ascent` &mdash; The recommended distance above the baseline for <nobr>single-spaced</nobr> text. * `descent` &mdash; The recommended distance below the baseline for <nobr>single-spaced</nobr> text. * `leading` &mdash; The recommended additional space to add between lines of text. * `height` &mdash; The calculated value of text height; this is the absolute value of `ascent` plus the absolute value of `descent`.  <div style="max-width: 655px; margin-top: 12px; margin-bottom: 12px;">  ![][images.docs.metrics]  </div>  
--- @param fontName string The name of the font, for example <nobr>`"Times New Roman"`</nobr>, `"DroidSansMono"`, or `"Monaco"`. Alternatively, this can point to an actual font file as in `"CoolCustomFont.ttf"`. See the [Using Custom Fonts][guide.system.customFont] guide for more details on using custom fonts in Corona.
--- @param fontSize number? The desired font size in __points__.
--- @return table
function graphics.getFontMetrics(fontName, fontSize) end

---  This function allows you to undefine/release custom shader effects.  
--- @param effect string The full name of the custom shader effect, as in <nobr>`"<category>.<group>.<name>"`</nobr>.
function graphics.undefineEffect(effect) end

---  Creates a [TextureResource][api.type.TextureResource] object which allows you to access and manage textures. This can be used to <nobr>pre-load</nobr> a texture/image and prevent it from being disposed when there is no display object using it.  After the [TextureResource][api.type.TextureResource] object is created, you can use it in <nobr>texture-related</nobr> instances by specifying the [filename][api.type.TextureResource.filename] and [baseDir][api.type.TextureResource.baseDir] properties.  <div class="guide-notebox-imp"> <div class="notebox-title-imp">Important</div>  There are several important nuances you should understand before using [TextureResource][api.type.TextureResource] objects — see the next section for details.  </div>  
--- @param params table Table containing the required parameters for the [TextureResource][api.type.TextureResource] object — see the next section for details.
--- @return TextureResource
function graphics.newTexture(params) end

