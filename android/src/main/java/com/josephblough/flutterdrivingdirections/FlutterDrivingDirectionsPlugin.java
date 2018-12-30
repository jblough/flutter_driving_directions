package com.josephblough.flutterdrivingdirections;

import android.content.Intent;
import android.net.Uri;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterDrivingDirectionsPlugin */
public class FlutterDrivingDirectionsPlugin implements MethodCallHandler {
  final private Registrar registrar;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_driving_directions");
    channel.setMethodCallHandler(new FlutterDrivingDirectionsPlugin(registrar));
  }

  private FlutterDrivingDirectionsPlugin(Registrar registrar) {
    this.registrar = registrar;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("launchDirections")) {
      result.notImplemented();
    }

    Double latitude = call.argument("latitude");
    Double longitude = call.argument("longitude");
    String address = call.argument("address");

    String uri = "http://maps.google.com/maps?daddr=" + latitude + "," + longitude + " (" + address + ")";
    Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
    intent.setPackage("com.google.android.apps.maps");
    registrar.activity().startActivity(intent);
  }
}
