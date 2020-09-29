import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Maps{
  
  GoogleMapController mapController;
CameraPosition _initialLocation =
    CameraPosition(target: LatLng(20.5937, 78.9629), zoom: 3.474);

  Widget maps() {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(border: Border.all()),
      child: GoogleMap(
        // markers: markers != null ? Set<Marker>.from(markers) : null,
        initialCameraPosition: _initialLocation,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ),
    );
  }
}