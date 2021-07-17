import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
        markerId: MarkerId('2'),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarker,
        // icon: BitmapDescriptor.fromAssetImage(ImageConfiguration.size.width, 'assetName'),
        onTap: () => print('on tap marker'),
      ),
    ]);
  }

  ///this method added marker
  static void addMarker(double lat, double long) {
    markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarker,
        // icon: BitmapDescriptor.fromAssetImage(ImageConfiguration.size.width, 'assetName'),
        onTap: () => print('on tap marker'),
      ),
    );
  }
}
