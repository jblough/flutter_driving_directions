import Flutter
import UIKit
import MapKit

public class SwiftFlutterDrivingDirectionsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_driving_directions", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterDrivingDirectionsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let arguments = call.arguments as! Dictionary<String, Any>
    let latitude = arguments["latitude"] as! Double
    let longitude = arguments["longitude"] as! Double
    let address = arguments["address"] as! String

    if #available(iOS 10, *) {
      let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
      let placemark = MKPlacemark(coordinate: coordinate)
      let mapItem = MKMapItem(placemark: placemark)
      mapItem.name = address
      mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
  }
}
