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
    location
        .getLocation()
        .then((cL) => this.setState(() => currentLocation = cL));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double altitude = currentLocation["altitude"] * 3.28084;
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: currentLocation.length > 0
            ? Container(
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      onMapCreated: (GoogleMapController controller) async {
                        mapController = controller;
                      },
                      options: GoogleMapOptions(
                        myLocationEnabled: true,
                        cameraPosition: CameraPosition(
                            target: LatLng(
                              currentLocation["latitude"],
                              currentLocation["longitude"],
                            ),
                            zoom: 12.0),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: Container(
                        color: Colors.black54,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Current altitude ${altitude.toStringAsFixed(2)} feet'),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
  }
}
