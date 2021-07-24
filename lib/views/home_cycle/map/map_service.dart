import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class MapService {
  static List<Marker> markers = [];

  ///This method to get current location and animate with camera on this lat and long
  static Future<void> getCurrentLocation({
    required Completer<GoogleMapController> mapController,
    required LatLng initialPosition,
  }) async {
    Position position = await getCurrentLatLngOfUser();
    final GoogleMapController controller = await mapController.future;

    initialPosition = LatLng(position.latitude, position.longitude);
    final newCameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );
    controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
  }

  static Future<Position> getCurrentLatLngOfUser() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  ///This method to search then animate camera and add marker on map searched location
  static Future<LatLng> searchMap({
    required Completer<GoogleMapController> mapController,
    required TextEditingController searchTEC,
  }) async {
    try {
      final position =
          await GeocodingPlatform.instance.locationFromAddress(searchTEC.text);
      final GoogleMapController controller = await mapController.future;
      final newCameraPosition = CameraPosition(
        target: LatLng(position[0].latitude, position[0].longitude),
        zoom: 14.4746,
      );
      markers.isEmpty
          ? addMarker(position[0].latitude, position[0].longitude)
          : replaceMarker(position[0].latitude, position[0].longitude);
      GeocodingPlatform.instance.placemarkFromCoordinates(
        position[0].latitude,
        position[0].longitude,
      );
      controller.animateCamera(
        CameraUpdate.newCameraPosition(newCameraPosition),
      );
      getCurrentLatLngOfUser().then((value) {});
      return LatLng(position[0].latitude, position[0].longitude);
    } catch (e) {
      print('search exception>>>>>>>>>> $e');
      Fluttertoast.showToast(msg: 'No address matched with searched text');
      return LatLng(0, 0);
    }
  }

  ///this method replace marker which added
  static void replaceMarker(double lat, double long) {
    markers.replaceRange(0, 1, [
      Marker(
        markerId: MarkerId('pinMarker'),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () => print('on tap marker'),
      ),
    ]);
  }

  ///this method added marker
  static void addMarker(double lat, double long) {
    markers.add(
      Marker(
        markerId: MarkerId('pinMarker'),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () => print('on tap marker'),
      ),
    );
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  ///this method added custom marker
  static Future<void> addCustomMarker(
      double lat, double long, String image,String markerId) async {
    // BitmapDescriptor customMarker = await BitmapDescriptor.fromAssetImage(
    //   ImageConfiguration(devicePixelRatio: 3.2, size: Size(4, 4)),
    //   image,
    // );
    final Uint8List markerIcon = await getBytesFromAsset(image, 150);
    markers.add(
      Marker(
        markerId: MarkerId(markerId),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.fromBytes(markerIcon),
      ),
    );
  }
}
