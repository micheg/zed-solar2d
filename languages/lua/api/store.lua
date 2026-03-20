---@meta

---This library allows you to support <nobr>in-app</nobr> purchasing on iOS, including <nobr>in-game</nobr> currency, upgrades, and more.For in-app purchasing on other platforms, see the documentation for [Google Billing][plugin.apple-iap] or [Amazon IAP][plugin.amazon-iap-v3].<div class="guide-notebox"><div class="notebox-title">Notes</div>* This is the legacy version of the Apple store IAP, please use the new [Apple IAP Plugin][plugin.apple-iap].* To use <nobr>in-app</nobr> purchases on iOS, you must first configure your iOS certificates, App&nbsp;IDs, and provisioning profiles. Please review our [Provisioning and Building][guide.distribution.iOSBuild] guide thoroughly, as this is an essential task and you must complete each step correctly. Also remember to create an App&nbsp;ID that is unique and fully qualified, __not__ a wildcard App&nbsp;ID.* Additional configuration must occur within [iTunes&nbsp;Connect](https://itunesconnect.apple.com/). If you need assistance with this process, please see Apple's [documentation](https://developer.apple.com/library/ios/technotes/tn2259/_index.html).* For additional functionality, please take a look at [Apple IAP][plugin.apple-iap] plugin.</div>
---@class store
---@field canMakePurchases boolean
---@field isActive boolean
---@field target string
---@field canLoadProducts boolean
local store = {}

---  Initiates a purchase transaction on provided product(s) by sending out a purchase request to the store, then dispatches a [storeTransaction][api.library.store.event.storeTransaction] event to the listener defined in [store.init()][api.library.store.init].  
--- @param productIdentifiers string _[String][api.type.String] or [Table][api.type.Table]._ String or an array (table) of strings where each string represents the product identifier of an item to purchase.
function store.purchase(productIdentifiers) end

---  Initiates a request to retrieve item data, dispatching a [productList][api.library.store.event.productList] event to the listener defined as `productListener`.  
--- @param productIdentifiers table An array of strings indicating a list of product identifiers.
--- @param productListener Listener The listener that will receive the [productList][api.library.store.event.productList] event.
function store.loadProducts(productIdentifiers, productListener) end

---  Notifies the Apple Store that a transaction is complete.  <div class="guide-notebox-imp"> <div class="notebox-title-imp">Important</div>  You must call this function following every successful transaction. If you don't, Apple will assume that the transaction was interrupted and will attempt to resume it sometime after the next application launch.  If you're offering the item as downloadable content, do not call this function until the download is complete.  </div>  
--- @param transaction table Table containing data related to the [transaction][api.library.store.event.storeTransaction.transaction].
function store.finishTransaction(transaction) end

---  Users who wipe the information on a device or buy a new device may wish to restore previously purchased items. This function initiates the process of retrieving all valid purchases.  During this process, the [storeTransaction][api.library.store.event.storeTransaction] listener defined in [store.init()][api.library.store.init] may be called multiple times, once for each item.  
function store.restore() end

---  This call is required and must be executed before making other Apple&nbsp;IAP calls. This prepares the Apple&nbsp;IAP library and, upon successful initialization, sets [store.isActive][api.library.store.isActive] to `true`.  This also allows you to detect [storeTransaction][api.library.store.event.storeTransaction] events to the listener defined as `listener`.  
--- @param listener Listener The listener that will handle [storeTransaction][api.library.store.event.storeTransaction] events.
function store.init(listener) end

return store
