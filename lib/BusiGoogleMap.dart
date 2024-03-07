import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps/google_maps_drawing.dart';

class BusiGoogleMap extends StatelessWidget {
  const BusiGoogleMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(37.43296265331129, -122.08832357078792),
        zoom: 50,
      ),
      markers: {
        Marker(
          markerId: MarkerId("demo"),
          position: LatLng(37.43296265331129, -122.08832357078792),
          draggable: true,
          onDragEnd: (value) {},
        ),
      },
      circles: {
        Circle(
          circleId: CircleId('1'),
          center: LatLng(37.43296265331129, -122.08832357078792),
          radius: 40,
          strokeWidth: 2,
          fillColor: Color(0xff006491).withOpacity(0.3),
        ),
      },
    );
  }
}

//method.map((method){
// return value
//})


//Navigation and Route