---@meta

---The map view feature lets you integrate one or more map views into your app. It supports various methods of <nobr>two-way</nobr> communication between the map contents and the surrounding application, including address or landmark lookup, marking the map with pins, and reverse geocoding (converting latitude/longitude into the closest street address).
---@class Map: userdata
---@field isZoomEnabled boolean
---@field isLocationVisible boolean
---@field mapType string
---@field isScrollEnabled boolean
local Map = {}

---  Returns the nearest address based on the given latitude and longitude values, returned as a [mapAddress][api.event.mapAddress] event.  
--- @param latitude number The latitude in degrees of the desired location.
--- @param longitude number The longitude in degrees of the desired location.
--- @param resultHandler Listener? The listener function to be invoked for the [mapAddress][api.event.mapAddress] event.
---@param self any
function Map.nearestAddress(self, latitude, longitude, resultHandler) end

---  Returns a [table][api.type.Table] containing values for the user's current location, including:  * `latitude` &mdash; The latitude in degrees of the current GPS location.  * `longitude` &mdash; The longitude in degrees of the current GPS location.  * `altitude` &mdash; The altitude in meters of the current GPS location.  * `accuracy` &mdash; The accuracy of the GPS location in meters. If negative, the latitude and longitude are not valid.  * `speed` &mdash; The instantaneous speed of the GPS device in meters per second. Divide the results by `0.447` to get MPH (miles&nbsp;per&nbsp;hour).  * `direction` &mdash; The direction the device is traveling in degrees clockwise from true north. If negative, the direction is invalid.  * `time` &mdash; Returns the UTC timestamp of the GPS location event. This is a <nobr>Unix-style</nobr> timestamp, expressed in seconds since <nobr>Jan. 1, 1970</nobr>.  * `errorCode` &mdash; A platform-specific integer for an error condition that is not language dependent. See [Error Handling](#errors) below for details.  * `errorMessage` &mdash; A string that describes an error in acquiring a GPS location from the device. See [Error Handling](#errors) below for details. The string may be localized according to the user's language.  
--- @return table
---@param self any
function Map.getUserLocation(self) end

------  Moves the displayed map region to a new location, using the new center point but maintaining the zoom level. The final parameter is an optional boolean (default `false`) that determines whether the transition is animated or happens instantly. 
--- @param latitude number The latitude of the map's center point.
--- @param longitude number The longitude of the map's center point.
--- @param isAnimated boolean? Specifies whether the transition is animated (`true`) or happens instantly (`false`, the default).
---@param self any
function Map.setCenter(self, latitude, longitude, isAnimated) end

---  Moves the displayed map region to a new location, with the new center point and horizontal/vertical span distances given in degrees of latitude and longitude. This implicitly sets the zoom level. This function will "sanity-check" the span settings and will interpolate a consistent zoom level even if `latitudeSpan` and `longitudeSpan` are specified with radically different values. The final parameter is an optional boolean (default `false`) that determines whether the transition is animated or happens instantly.  Note that degrees of latitude and longitude cover large distances on the Earth, so fairly small changes will translate into big position changes in the map, especially at close zoom levels. Also note that most of the planet's map locations are fairly empty, so it will generally be easier to work with known latitude/longitude values when experimenting with maps. Try looking up your own address on a site like [Google Maps](https://www.google.com/maps) if you need a quick test location. 
--- @param latitude number The latitude of the region's center point.
--- @param longitude number The longitude of the region's center point.
--- @param latitudeSpan number The region's latitudinal span in degrees. This implicitly sets the map's zoom level.
--- @param longitudeSpan number The region's longitudinal span in degrees. This implicitly sets the map's zoom level.
--- @param isAnimated boolean? Specifies whether to animate the map from the current region to the new one. Default is `false`.
---@param self any
function Map.setRegion(self, latitude, longitude, latitudeSpan, longitudeSpan, isAnimated) end

---  Clears a specific marker (pin) from the map. 
--- @param markerID number The marker's identification number, for example the value returned from the  [object:addMarker()][api.type.Map.addMarker] function. 
---@param self any
function Map.removeMarker(self, markerID) end

---  This is a replacement for the deprecated [object:getAddressLocation()][api.type.Map.getAddressLocation].  Returns the numerical latitude and longitude values of the given location string. The coordinates are returned as a [mapLocation][api.event.mapLocation] event. The coordinates can then be used to place a marker on the map, <nobr>re-center</nobr> the map to the desired location, or perform any of the other functions that use a latitude and longitude pair.  This function will accept virtually any address or intersection format as input, along with the names of some famous landmarks.  
---@param self any
function Map.requestLocation(self) end

---@param self any
function Map.requestLocation(self) end

---  Clears all markers (pins) from the map. 
---@param self any
function Map.removeAllMarkers(self) end

---  Adds a pin to the map at the specified location. The optional title and subtitle will appear on a small popup when the pin is touched.  If a custom image is specified then the bottom center of the image will be the pinned location.  This function returns an identification number for the marker added, or `nil` if there was a failure. This number can be used along with [object:removeMarker()][api.type.Map.removeMarker] to remove a marker.  
--- @param latitude number The marker's latitude in degrees.
--- @param longitude number The marker's longitude in degrees.
--- @param options table? A table of options for the marker — see the next section for details.
--- @return number
---@param self any
function Map.addMarker(self, latitude, longitude, options) end

