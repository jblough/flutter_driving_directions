#import "FlutterDrivingDirectionsPlugin.h"

#import <MapKit/MapKit.h>

@implementation FlutterDrivingDirectionsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_driving_directions"
            binaryMessenger:[registrar messenger]];
  FlutterDrivingDirectionsPlugin* instance = [[FlutterDrivingDirectionsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

  if ([@"launchDirections" isEqualToString:call.method]) {
    result(FlutterMethodNotImplemented);
  } else {
    NSNumber *latitude = call.arguments[@"latitude"];
    NSNumber *longitude = call.arguments[@"longitude"];
    NSString *address = call.arguments[@"address"];

    if (@available(iOS 10.0, *)) {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([latitude doubleValue], [longitude doubleValue]);
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate: coordinate];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark: placemark];
        mapItem.name = address;
        NSDictionary *options = [[NSDictionary alloc] initWithObjectsAndKeys:
            MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsDirectionsModeKey, nil];
        [mapItem openInMapsWithLaunchOptions: options];
    }
  }
}

@end
