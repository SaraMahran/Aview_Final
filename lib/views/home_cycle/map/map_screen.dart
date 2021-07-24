import 'dart:async';

import 'package:aview2/helper/helper_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'map_service.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  Completer<GoogleMapController> mapController = Completer();
  TextEditingController searchTEC = TextEditingController(text: '');

  late double lat = 0, long = 0;

  @override
  void initState() {
    MapService.addCustomMarker(
        29.994209, 31.160527, 'assets/images/test/kfc_logo.png', '1');
    MapService.addCustomMarker(30.007015, 31.194833,
        'assets/images/test/chicken_fila_logo.jpeg', '2');
    MapService.addCustomMarker(30.207015, 31.194833,
        'assets/images/test/chicken_fila_logo.jpeg', '3');

    MapService.getCurrentLocation(
      mapController: mapController,
      initialPosition: LatLng(0, 0),
    );
    MapService.getCurrentLatLngOfUser().then(
      (value) {
        lat = value.latitude;
        long = value.longitude;
        setState(() {});
      },
    );
    MapService.markers.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .7,
            ),
            zoomControlsEnabled: true,
            markers: Set.from(MapService.markers),
            mapType: MapType.normal,
            onTap: (point) {
              lat = point.latitude;
              long = point.longitude;
              setState(() {});
              print(
                  'pointLat = ${point.latitude} pointLong = ${point.longitude}');
              print('lat= $lat long = $long');
            },
            onMapCreated: (GoogleMapController controller) =>
                mapController.complete(controller),
            initialCameraPosition:
                CameraPosition(target: LatLng(lat, long), zoom: 12),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SafeArea(
              child: TextField(
                controller: searchTEC,
                style: TextStyle(),
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  MapService.searchMap(
                    mapController: mapController,
                    searchTEC: searchTEC,
                  ).then((value) {
                    lat = value.latitude;
                    long = value.longitude;
                  });
                  print('lat = $lat long = $long}');
                  setState(() {});
                },
                decoration: kRoundedDecorationTF.copyWith(
                  hintText: 'Search...',
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => searchTEC.clear(),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
