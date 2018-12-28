import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: (GoogleMapController controller) {},
          options: GoogleMapOptions(
            myLocationEnabled: true,
          ),
        ),
      ),
    );
  }
}
