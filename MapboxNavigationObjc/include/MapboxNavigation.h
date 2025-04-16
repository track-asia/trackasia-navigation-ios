#import <Foundation/Foundation.h>

//! Project version number for MapboxNavigation.
FOUNDATION_EXPORT double MapboxNavigationVersionNumber;

//! Project version string for MapboxNavigation.
FOUNDATION_EXPORT const unsigned char MapboxNavigationVersionString[];

#import "../MBRouteVoiceController.h"
#if __has_include(<TrackAsia/Mapbox.h>)
#import <TrackAsia/Mapbox.h>
#elif __has_include(<TrackAsia/TrackAsia.h>)
#import <TrackAsia/TrackAsia.h>
#endif
