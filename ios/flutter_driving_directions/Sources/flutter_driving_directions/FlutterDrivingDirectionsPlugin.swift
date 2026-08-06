import Flutter
import UIKit
import MapKit

public class FlutterDrivingDirectionsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_driving_directions", binaryMessenger: registrar.messenger())
    let instance = FlutterDrivingDirectionsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let arguments = call.arguments as! Dictionary<String, Any>
    let latitude = arguments["latitude"] as! Double
    let longitude = arguments["longitude"] as! Double
    let label = arguments["label"] as! String

    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let placemark = MKPlacemark(coordinate: coordinate)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = label
    mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
  }
}
