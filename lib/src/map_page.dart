import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() {
    return new MapPageState();
  }
}

class MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  Map<String, double> currentLocation;
  Location location;

  @override
  void initState() {
    currentLocation = <String, double>{};
    location = Location();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: (GoogleMapController controller) async {
            mapController = controller;
            try {
              currentLocation = await location.getLocation();
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(currentLocation["latitude"], currentLocation["longitude"]), zoom: 12.0),
                ),
              );
            } catch (Exception) {
              currentLocation = null;
            }
          },
          options: GoogleMapOptions(
            myLocationEnabled: true,
          ),
        ),
      ),
    );
  }
}
