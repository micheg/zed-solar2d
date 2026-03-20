---@meta

---
---@class display
---@field screenOriginX number
---@field contentCenterX number
---@field viewableContentWidth number
---@field viewableContentHeight number
---@field imageSuffix string
---@field topStatusBarContentHeight number
---@field statusBarHeight number
---@field pixelWidth number
---@field fps number
---@field contentScaleX number
---@field contentScaleY number
---@field safeActualContentWidth number
---@field actualContentHeight number
---@field contentWidth number
---@field screenOriginY number
---@field safeScreenOriginY number
---@field safeActualContentHeight number
---@field safeScreenOriginX number
---@field actualContentWidth number
---@field currentStage StageObject
---@field pixelHeight number
---@field contentHeight number
---@field contentCenterY number
display = {}

---  Creates a rounded rectangle object. The corners are rounded by quarter circles of a specified radius value. The local origin is at the center of the rectangle and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.  
--- @param parent GroupObject? An optional display group in which to insert the rounded rectangle.
--- @param x number The __x__ and __y__ coordinates for the center of the rectangle.
--- @param y number The __x__ and __y__ coordinates for the center of the rectangle.
--- @param width number Width and height of the rectangle.
--- @param height number Width and height of the rectangle.
--- @param cornerRadius number Corners are rounded by quarter circles of this radius value.
--- @return ShapeObject
---@overload fun (x:number, y:number, width:number, height:number, cornerRadius:number):ShapeObject
function display.newRoundedRect(parent, x, y, width, height, cornerRadius) end

---  Captures the contents of the screen and returns it as a new [display object][api.type.DisplayObject]. You can optionally save the capture as a file to the device's photo library.  Calling this method places the captured image on the screen on top of all other display objects. Use [object:removeSelf()][api.type.DisplayObject.removeSelf] to remove this object from the screen.  <div class="guide-notebox"> <div class="notebox-title">Note</div>  This capture function will only capture what is rendered in OpenGL. It will __not__ capture native display objects such as text input boxes/fields, web&nbsp;popups, ads, etc.  </div>   <a id="gotchas"></a> 
--- @param saveToPhotoLibrary boolean? If `true`, then it adds the image to your device's photo library. For Android and iOS devices, this also necessitates the requirements outlined in [Gotchas](#gotchas).
--- @return DisplayObject
function display.captureScreen(saveToPhotoLibrary) end

---  Containers are a special kind of group in which the children are clipped (masked) by the bounds of the container.  See the [Using Containers][guide.graphics.container] guide for more information. 
function display.newContainer() end

---  Creates an embossed text object. The local origin is at the center of the text and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.  Text is wrapped either at newlines or by specifying a `width` and `height` when the object is created.  By default, the text color is white <nobr>`( 1, 1, 1 )`</nobr>. See [object:setFillColor()][api.type.ShapeObject.setFillColor] for more information.  
---@class NewEmbossedTextOptions
--- @field parent GroupObject? Display group in which to insert the text object.
--- @field text string The text to display. Similarly, to change the displayed text for a text object after it has been created, set the [object.text][api.type.TextObject.text] property.
--- @field x number? Coordinates for the object's __x__ and __y__ center point.
--- @field y number? Coordinates for the object's __x__ and __y__ center point.
--- @field width number? If supplied, text will be wrapped at `width` and cropped at `height`. Set `height` to `0` and the text box height will adjust to the amount of text, but never exceed the maximum texture height for the device.
--- @field height number? If supplied, text will be wrapped at `width` and cropped at `height`. Set `height` to `0` and the text box height will adjust to the amount of text, but never exceed the maximum texture height for the device.
--- @field font string _[String][api.type.String], [Userdata][api.type.Userdata], or [Constant][api.type.Constant]._ This can be one of the following:* The font family name (typeface name). You may obtain an array of available font names via [native.getFontNames()][api.library.native.getFontNames].* Name of the font file in the Corona project's main resource directory (alongside `main.lua`).* A font object returned by [native.newFont()][api.library.native.newFont].* A font constant such as [native.systemFont][api.library.native.systemFont] or [native.systemFontBold][api.library.native.systemFontBold].
--- @field fontSize number? The size of the text in Corona content points. The system's default font size will be used if this parameter is omitted or if it's set to `nil` or `0`.<div class="guide-notebox-imp"><div class="notebox-title-imp">Important</div>To change the font size of a text object __after__ it has been created, set the [object.size][api.type.TextObject.size] property, __not__ `object.fontSize`.</div>
--- @field align string? This specifies the alignment of the text when the width is known, meaning it either contains a newline or the `width` parameter is supplied. Default value is `"left"`. Valid values are `"left"`, `"center"`, or `"right"`.


--- @param NewEmbossedTextOptions NewEmbossedTextOptions
--- @return TextObject
function display.newEmbossedText(NewEmbossedTextOptions) end

---  This function is the same as [display.save()][api.library.display.save], but it returns a display object instead of saving to a file by default. You can optionally save the capture to the device's photo library, but this is not the default action &mdash; you must explicitly tell it to do so when calling the function.  Essentially, `display.capture()` can be thought of as a hybrid between [display.save()][api.library.display.save] and [display.captureScreen()][api.library.display.captureScreen].  <div class="guide-notebox"> <div class="notebox-title">Note</div>  This capture function will only capture what is rendered in OpenGL. It will __not__ capture native display objects such as text input boxes/fields, web&nbsp;popups, ads, etc.  </div>   <a id="gotchas"></a> 
--- @param displayObject DisplayObject The variable that references the display object/group to capture.
--- @param options table? A table of options for the capture — see the next section for details.
--- @return DisplayObject
function display.capture(displayObject, options) end

---  Draws a polygon shape by providing the outline (contour) of the shape. This includes convex or concave shapes. Self-intersecting shapes, however, are not supported and will result in undefined behavior.  The local origin is at the center of the polygon and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.  
--- @param parent GroupObject? An optional display group in which to insert the polygon.
--- @param x number The location of the object relative to its parent.
--- @param y number The location of the object relative to its parent.
--- @param vertices Array An array of __x__ and __y__ coordinates. These coordinates will automatically be re-centered about the center of the polygon.
--- @return ShapeObject
---@overload fun (x:number, y:number, vertices:Array):ShapeObject
function display.newPolygon(parent, x, y, vertices) end

---  Draws a mesh shape by providing vertices of the shape. The local origin is at the center of the mesh and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.  
---@class NewMeshOptions
--- @field parent GroupObject? An optional display group in which to insert the mesh.
--- @field x number? The location of the object relative to its parent.
--- @field y number? The location of the object relative to its parent.
--- @field options table Table containing options for the mesh &mdash; see the next section for details.


--- @param NewMeshOptions NewMeshOptions
--- @return ShapeObject
function display.newMesh(NewMeshOptions) end

---  Displays an image on the screen from a file. This image supports tinting via [object:setFillColor][api.type.ShapeObject.setFillColor]. The local origin is at the center of the image and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.  <div class="docs-tip-outer"> <div class="docs-tip-inner-left"> <div class="fa fa-cog"></div> </div> <div class="docs-tip-inner-right">  The difference between this function and [display.newImage()][api.library.display.newImage] is that `display.newImageRect()` automatically substitutes <nobr>higher-resolution</nobr> assets on <nobr>higher-resolution</nobr> devices, making this function ideal for displaying images across devices of varying resolutions. The actual image chosen will depend on the current content scale determined by Corona. This is based on the ratio between the current screen and the base content dimensions defined in `config.lua`. Based on this, Corona uses the `imageSuffix` table (also&nbsp;defined in `config.lua`) which lists the suffixes for the same family of images, and this function finds the best match from the image choices available. At any time, the chosen suffix is accessible via the <nobr>read-only</nobr> property [display.imageSuffix][api.library.display.imageSuffix]. Please refer to the [Project Configuration][guide.basics.configSettings] guide for more information.  </div> </div>  Essentially, `display.newImageRect()` should always be used to load images when content scaling is enabled, and this function can be used in two ways:  1. Use multiple image files designed for targeted devices and display the correct image based on the resolution/screen of each device. 2. Resize high-resolution images to fit the existing content width and height. Since this only uses one <nobr>high-resolution</nobr> image, it uses more texture memory than method 1, but handles the case of sizing an image that will be used on multiple device resolutions.  
--- @param parent GroupObject? An optional display group in which to insert the image.
--- @param filename string The name of the image file to load, relative to `baseDir` (or `system.ResourceDirectory` by default).
--- @param baseDir Constant? Specifies the base directory where `filename` is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.
--- @param width number The content width of the image, which is the width within the reference screen of the content. When using trimmed frames that have been packed into an [ImageSheet][api.type.ImageSheet] by programs like [TexturePacker](http://www.codeandweb.com/texturepacker/), specify the _trimmed_ width, not the width of the original uncropped frame.
--- @param height number The content height of the image, which is the height within the reference screen of the content. When using trimmed frames that have been packed into an [ImageSheet][api.type.ImageSheet] by programs like [TexturePacker](http://www.codeandweb.com/texturepacker/), specify the _trimmed_ height, not the height of the original uncropped frame.
--- @return DisplayObject
---@overload fun (imageSheet:ImageSheet, frameIndex:number, width:number, height:number):DisplayObject
---@overload fun (filename:string, baseDir:Constant?, width:number, height:number):DisplayObject
---@overload fun (filename:string, width:number, height:number):DisplayObject
function display.newImageRect(parent, filename, baseDir, width, height) end

--- @param parent GroupObject? An optional display group in which to insert the image. By default, uses the current stage (as returned from [display.getCurrentStage()][api.library.display.getCurrentStage]) if no parent is specified.
--- @param imageSheet ImageSheet Reference to an image sheet object created with [graphics.newImageSheet()][api.library.graphics.newImageSheet]. This is only required if you intend to create an object from an image sheet.
--- @param frameIndex number Represents the frame index number within the [ImageSheet][api.type.ImageSheet] to create the object from. This is only required if `imageSheet` is specified.
--- @param width number The content width of the image, which is the width within the reference screen of the content. When using trimmed frames that have been packed into an [ImageSheet][api.type.ImageSheet] by programs like [TexturePacker](http://www.codeandweb.com/texturepacker/), specify the _trimmed_ width, not the width of the original uncropped frame.
--- @param height number The content height of the image, which is the height within the reference screen of the content. When using trimmed frames that have been packed into an [ImageSheet][api.type.ImageSheet] by programs like [TexturePacker](http://www.codeandweb.com/texturepacker/), specify the _trimmed_ height, not the height of the original uncropped frame.
--- @return DisplayObject
---@overload fun (imageSheet:ImageSheet, frameIndex:number, width:number, height:number):DisplayObject
---@overload fun (filename:string, baseDir:Constant?, width:number, height:number):DisplayObject
---@overload fun (filename:string, width:number, height:number):DisplayObject
function display.newImageRect(parent, imageSheet, frameIndex, width, height) end

---  Returns four numbers corresponding to the top, left, bottom, and right "safe&nbsp;area" insets. The "safe&nbsp;area" is the rectangular region where it's safe to place important UI elements, ensuring that they are not obscured by status bars, device aspects like a sensor bar or rounded corners, software buttons, TV overscan areas, etc.  Essentially, these inset values represent the distance, in content units, between the corresponding screen edge and the imaginary boundary line where such elements will not interfere with or obscure screen content.  
--- @return number
function display.getSafeAreaInsets() end

---  This function creates an [EmitterObject][api.type.EmitterObject], used to display particle effects.  <div class="guide-notebox-imp"> <div class="notebox-title-imp">Important</div>  Particles emitted by an emitter are __not__ automatically removed unless their lifespan completes, nor are they destroyed if they move off screen. If you're using [Composer][api.library.composer] for scene management, emitters created with	`display.newEmitter()` should be inserted into the Composer scene view (or&nbsp;a&nbsp;child group of the scene&nbsp;view) so that they will be removed when the scene is exited. If you're not using Composer, you can manually destroy the emitter with [object:removeSelf()][api.type.Joint.removeSelf] or [display.remove()][api.library.display.remove] to remove all particles it generated.  </div>  <div class="guide-notebox"> <div class="notebox-title">Note</div>  On macOS, [Particle Designer](https://www.71squared.com/particledesigner) can be used to design and output emitters as <nobr>JSON-encoded</nobr> files. Otherwise, emitter properties can simply be passed to this function as <nobr>key-value</nobr> pairs in a Lua table. See the examples below for usage details.  </div>  
--- @param emitterParams table A table of parameters for the emitter. See the [EmitterObject][api.type.EmitterObject] documentation for a list of valid properties.
--- @param baseDir Constant? Specifies the base directory where the particle emitter image file is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.
--- @return EmitterObject
function display.newEmitter(emitterParams, baseDir) end

---  Creates a rectangle object. The local origin is at the center of the rectangle and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.  
--- @param parent GroupObject? An optional display group in which to insert the rectangle.
--- @param x number The __x__ and __y__ coordinates for the center of the rectangle.
--- @param y number The __x__ and __y__ coordinates for the center of the rectangle.
--- @param width number Width and height of the rectangle.
--- @param height number Width and height of the rectangle.
--- @return ShapeObject
---@overload fun (x:number, y:number, width:number, height:number):ShapeObject
function display.newRect(parent, x, y, width, height) end

---  Captures a portion of the screen and returns it as a new [DisplayObject][api.type.DisplayObject]. You can specify what portion of the screen to capture by passing in rectangular bounds. You can optionally save the capture image as a file to the device's photo library.  Calling this method places the captured image on the screen in front of other display objects. Use [object:removeSelf()][api.type.DisplayObject.removeSelf] to remove this object from the screen.  <div class="guide-notebox"> <div class="notebox-title">Note</div>  This capture function will only capture what is rendered in OpenGL. It will __not__ capture native display objects such as text input boxes/fields, web&nbsp;popups, ads, etc.  </div>   <a id="gotchas"></a> 
--- @param screenBounds table Specifies the portion of the screen to capture as a rectangle whose bounds are in content coordinates. This table must contain the following properties or else an error will occur.`````lualocal screenBounds ={    xMin = 0,    xMax = 100,    yMin = 0,    yMax = 100}`````You can also pass in the bounds table returned by an [object.contentBounds][api.type.DisplayObject.contentBounds] property, which will capture that object and everything behind it.Note that this capture function can only capture what is displayed on screen. If the coordinates in this bounds table exceed the bounds of the screen, then the resulting capture image will be trimmed to the bounds of the screen. If the bounds table is completely outside of the screen, then this function will do nothing and return `nil`.<a id="options-reference"></a>
--- @param saveToPhotoLibrary boolean? If `true`, then it adds the image to your device's photo library. For Android and iOS devices, this also necessitates the requirements outlined in [Gotchas](#gotchas).
--- @return DisplayObject
function display.captureBounds(screenBounds, saveToPhotoLibrary) end

---  Renders the [display object][api.type.DisplayObject] referenced by first argument into a JPEG or PNG image and saves it as a new file. The display object must currently be in the display hierarchy or no image will be saved. If the object is a display group, all children are also rendered.  When content scaling is enabled, `display.save()` saves the image in the device's native resolution. For instance, if this method is used to save a 100&times;200 pixel display object, it may have more actual pixels when saved on a device with higher resolution.  
--- @param displayObject DisplayObject The variable that references the display object/group to save.
--- @param options table? A table of options for the save — see the next section for details.
function display.save(displayObject, options) end

---  Displays an image on the screen from a file (supports tinting via [object:setFillColor][api.type.ShapeObject.setFillColor]). The local origin is at the center of the image and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.  Note that [display.newImageRect()][api.library.display.newImageRect] should be used instead to load images when content scaling is enabled.  Image objects are the same as [rectangle objects][api.library.display.newRect] in which the `object.fill` property is set to be an image.  
--- @param parent GroupObject? An optional display group in which to insert the image object.
--- @param filename string The name of the image file to load, relative to `baseDir` (or `system.ResourceDirectory` by default).
--- @param baseDir Constant? Specifies the base directory where `filename` is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.
--- @param x number? The __x__ coordinate of the image.
--- @param y number? The __y__ coordinate of the image.
--- @return DisplayObject
---@overload fun (filename:string, baseDir:Constant?, x:number?, y:number?):DisplayObject
---@overload fun (filename:string, x:number?, y:number?):DisplayObject
---@overload fun (imageSheet:ImageSheet, frameIndex:number, x:number?, y:number?):DisplayObject
---@overload fun (imageSheet:ImageSheet, frameIndex:number):DisplayObject
function display.newImage(parent, filename, baseDir, x, y) end

--- @param parent GroupObject? An optional display group in which to insert the image object.
--- @param imageSheet ImageSheet Reference to an image sheet object created with [graphics.newImageSheet()][api.library.graphics.newImageSheet]. This is only required if you intend to create an object from an image sheet.
--- @param frameIndex number Represents the frame index number within the [ImageSheet][api.type.ImageSheet] to create the object from. This is only required if `imageSheet` is specified.
--- @param x number? The __x__ coordinate of the image.
--- @param y number? The __y__ coordinate of the image.
--- @return DisplayObject
---@overload fun (filename:string, baseDir:Constant?, x:number?, y:number?):DisplayObject
---@overload fun (filename:string, x:number?, y:number?):DisplayObject
---@overload fun (imageSheet:ImageSheet, frameIndex:number, x:number?, y:number?):DisplayObject
---@overload fun (imageSheet:ImageSheet, frameIndex:number):DisplayObject
function display.newImage(parent, imageSheet, frameIndex, x, y) end

---  Draw a line from one point to another. Optionally, you may append points to the end of the line to create outline shapes or paths.  
--- @param parent GroupObject? An optional display group in which to insert the line.
--- @param x1 number Coordinates of the beginning of the line.
--- @param y1 number Coordinates of the beginning of the line.
--- @param x2 number Coordinates of the end of the line.
--- @param y2 number Coordinates of the end of the line.
--- @param x3 number? Additional coordinates.
--- @param y3 number? Additional coordinates.
--- @param ... number? Additional coordinates.
--- @return LineObject
---@overload fun (x1:number, y1:number,x2:number, y2:number, ...:number?):LineObject
---@overload fun (x1:number, y1:number,x2:number, y2:number):LineObject
function display.newLine(parent, x1, y1, x2, y2, x3, y3, ...) end

---  Hides or changes the appearance of the status bar on most devices.  
--- @param mode Constant This argument should be one of the following:* `display.HiddenStatusBar`* `display.DefaultStatusBar`* `display.TranslucentStatusBar`* `display.DarkStatusBar`* `display.LightTransparentStatusBar`* `display.DarkTransparentStatusBar`
function display.setStatusBar(mode) end

---  Sets the draw mode. 
--- @param key string Specifies the type of draw mode. See [Keys](#keys) below.<a id="keys"></a>
function display.setDrawMode(key) end

---  Removes an object or group if not `nil`.  This is the same as calling [object:removeSelf()][api.type.DisplayObject.removeSelf], but will first check if the object exists before attempting to remove.  
--- @param object DisplayObject The variable referencing the display object <nobr>(vector, image, or group)</nobr> to be removed.
function display.remove(object) end

---  Set default display values including default colors for display objects, anchor point defaults, texture wrapping settings, etc. 
--- @param key string Specifies the key to set the default value for.
--- @param gray number? Color values between `0` and `1`.
--- @param r number? Color values between `0` and `1`.
--- @param g number? Color values between `0` and `1`.
--- @param b number? Color values between `0` and `1`.
--- @param alpha number? Color values between `0` and `1`.
function display.setDefault(key, gray, r, g, b, alpha) end

---  Snapshot objects let you capture a group of display objects and render them into a flattened image. The image is defined by objects that are added to the snapshot's [group][api.type.SnapshotObject.group] property.  Learn more about snapshots in the [Snapshots][guide.graphics.snapshot] guide. 
--- @param parent GroupObject? An optional display group in which to insert the snapshot.
--- @param w number Width and height of the snapshot.
--- @param h number Width and height of the snapshot.
--- @return SnapshotObject
---@overload fun (w:number, h:number):SnapshotObject
function display.newSnapshot(parent, w, h) end

---  Creates a display group for organizing/layering display objects. Initially, there are no children in a group. The local origin is at the parent's origin; the anchor point is initialized to this local origin.  See the [Group Programming][guide.graphics.group] guide for more information. 
--- @return GroupObject
function display.newGroup() end

---  Get the color of a pixel on screen. 
--- @param x number The __x__ coordinate of the pixel on screen, in content coordinates.
--- @param y number The __y__ coordinate of the pixel on screen, in content coordinates.
--- @param listener Listener The event listener to receive the result.
function display.colorSample(x, y, listener) end

---  Returns a reference to the current stage object, which is the parent group for all display objects and groups. Currently, Corona has a single stage instance, so this function always returns a reference to the same object.  
--- @return DisplayObject
function display.getCurrentStage() end

---  Creates a sprite object. Sprites allow for animated sequences of frames that reside on __image&nbsp;sheets__. Please see the [Sprite Animation][guide.media.spriteAnimation] and [Image Sheets][guide.media.imageSheets] guides for more information.  The local origin is at the center of the sprite and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.  By default, sprites use frames that reside on a single image sheet. This corresponds to the image sheet you pass to the `display.newSprite()` constructor.  For each sequence, you can specify a different image sheet instead of using the default image sheet. You do this by using the optional `sheet` parameter in a `sequenceData` table. For details, see [Sequence&nbsp;Data](#sequencedata)&nbsp;below. 
--- @param parent GroupObject? An optional display group in which to insert the sprite.
--- @param imageSheet ImageSheet Specifies the default image sheet.
--- @param sequenceData table A table which holds data for a specific sequence. Or, if you have more than one animation sequence for a single object, `sequenceData` is then an array of tables that hold data for each sequence. For instance, you might have a character object with several different animation sequences such as `"walking"`, `"jumping"`, and `"swimming"`. Frames in a given sequence may be consecutive (`1,2,3,4,...`) or non-consecutive (`1,3,4,6,9,...`) within the image sheet. See [Sequence&nbsp;Data](#sequencedata) below.<a id="sequencedata"></a>
--- @return SpriteObject
---@overload fun (imageSheet:ImageSheet, sequenceData:table):SpriteObject
function display.newSprite(parent, imageSheet, sequenceData) end

---  This a convenience method, similar to [network.download()][api.library.network.download], which returns a [display&nbsp;object][api.type.DisplayObject] containing the image, as well as saving the image to a file.  
--- @param url string The HTTP request URL which should point to a valid remote PNG or JPG file.
--- @param method string The HTTP method; acceptable values are `"GET"` (default) or `"POST"`.
--- @param listener Listener The listener function invoked when the HTTP operation has completed. It is passed an `event` object that contains the following properties:* `event.response` &mdash; a string containing the destination file name. This is useful if you're writing a general event handler for a variety of file downloads.* `event.target` &mdash; the new display object created after the image is downloaded.* `event.isError` &mdash; a [Boolean][api.type.Boolean] value: `true` in the case of a network error; `false` if not.
--- @param params table? See the [Parameters](#params) section for more information.
--- @param destFilename string The name of the file to which the HTTP response will be saved.
--- @param baseDir Constant? The folder path to which the file will be saved.
--- @param x number? The __x__ and __y__ coordinates to place the newly created display object, once the file has been successfully downloaded and saved.<a id="params"></a>
--- @param y number? The __x__ and __y__ coordinates to place the newly created display object, once the file has been successfully downloaded and saved.<a id="params"></a>
---@overload fun (url:string, method:string, listener:Listener, destFilename:string, baseDir:Constant?, x:number?, y:number?)
---@overload fun (url:string, method:string, listener:Listener, destFilename:string, baseDir:Constant?,)
function display.loadRemoteImage(url, method, listener, params, destFilename, baseDir, x, y) end

---  Get default display values including default colors for display objects, anchor point defaults, texture wrapping settings, etc. 
--- @param key string Specifies the key to get the default value for.
function display.getDefault(key) end

---  Creates a circle with radius centered at specified coordinates (`xCenter`, `yCenter`). The local origin is at the center of the circle and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.  
--- @param parent GroupObject? An optional display group in which to insert the circle.
--- @param xCenter number The __x__ and __y__ coordinates for the center of the circle.
--- @param yCenter number The __x__ and __y__ coordinates for the center of the circle.
--- @param radius number The radius for the circle. This must be greater than `0`.
--- @return ShapeObject
---@overload fun (xCenter:number, yCenter:number, radius:number):ShapeObject
function display.newCircle(parent, xCenter, yCenter, radius) end

---  Creates a [text object][api.type.TextObject]. The local origin is at the center of the text and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.  Text is wrapped either at newlines or by specifying a `width` and `height` when the object is created.  By default, the text color is white <nobr>`( 1, 1, 1 )`</nobr>. See [object:setFillColor()][api.type.ShapeObject.setFillColor] for more information.  
---@class NewTextOptions
--- @field parent GroupObject? Display group in which to insert the text object.
--- @field text string The text to display. Similarly, to change the displayed text for a text object after it has been created, set the [object.text][api.type.TextObject.text] property.
--- @field x number? The __x__ coordinate of the text object.
--- @field y number? The __y__ coordinate of the text object.
--- @field width number? If supplied, text will be wrapped at this width.
--- @field height number? If supplied, text will be cropped at this height. Set this to `0` and the text box height will adjust to the amount of text, but never exceed the maximum texture height for the device.
--- @field font string _[String][api.type.String], [Userdata][api.type.Userdata], or [Constant][api.type.Constant]._ This can be one of the following:* The font family name (typeface name). You may obtain an array of available font names via [native.getFontNames()][api.library.native.getFontNames].* Name of the font file in the Corona project's main resource directory (alongside `main.lua`).* A font object returned by [native.newFont()][api.library.native.newFont].* A font constant such as [native.systemFont][api.library.native.systemFont] or [native.systemFontBold][api.library.native.systemFontBold].
--- @field fontSize number? The size of the text in Corona content points. The system's default font size will be used if this parameter is omitted or if it's set to `nil` or `0`.<div class="guide-notebox-imp"><div class="notebox-title-imp">Important</div>To change the font size of a text object __after__ it has been created, set the [object.size][api.type.TextObject.size] property, __not__ `object.fontSize`.</div>
--- @field align string? This specifies the alignment of the text when the width is known, meaning it either contains a newline or the `width` parameter is supplied. Default value is `"left"`. Valid values are `"left"`, `"center"`, or `"right"`.


--- @param NewTextOptions NewTextOptions
--- @return TextObject
function display.newText(NewTextOptions) end

