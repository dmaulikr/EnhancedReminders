# EnhancedReminders
Final Project for UPEI CS212
This is the Readme

MapKit classes
https://developer.apple.com/library/ios/documentation/MapKit/Reference/MapKit_Framework_Reference/
classes of interest
- MKETAResponse
- MKLocalSearch
  - An MKLocalSearch object initiates a map-based search operation and delivers the results back to your app asynchronously. Search objects are designed to perform one search operation only. To perform several different searches, you must create separate instances of this class and start them separately.
  - (instancetype)initWithRequest:(MKLocalSearchRequest *)request; initializes the object
    - MKLocalSearchRequest; Provides natural search querey for locations. Also look into the region propery. It gives a hint to make search faster
  -  (void)startWithCompletionHandler:(MKLocalSearchCompletionHandler)completionHandler; starts a search with the MKLocalSearchCompletionHandler.
    - MKLocalSearchCompletionHandler; Block that takes (MKLocalSearchResponse *response, NSError *error). response is the result of the search (an Array of MKMapItems), and error is any error that happens.
- MKReverseGeocoder (Don't think we need it)
- MKUserLocation
- MKReverseGeocoderDelegate


Mapkit Functions
https://developer.apple.com/library/ios/documentation/MapKit/Reference/MapKitFunctionsReference/index.html#//apple_ref/doc/uid/TP40008209

Functions of interest 
- MKMetersBetweenMapPoints


Mapkit datatypes
https://developer.apple.com/library/ios/documentation/MapKit/Reference/MapKitDataTypesReference/index.html#//apple_ref/c/tdef/MKCoordinateSpan

Types of interest 
- MKMapPoint
- MKMapItem


