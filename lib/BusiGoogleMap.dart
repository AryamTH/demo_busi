import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusiGoogleMap extends StatelessWidget {
  const BusiGoogleMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(37.43296265331129, -122.08832357078792)));
  }
}

//method.map((method){
// return value
//})


//Navigation and Route