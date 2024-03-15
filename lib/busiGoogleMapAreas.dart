import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class BusiGoogleMapAreas extends StatefulWidget {
  @override
  _BusiGoogleMapAreasState createState() => _BusiGoogleMapAreasState();
}

class _BusiGoogleMapAreasState extends State<BusiGoogleMapAreas> {
  static final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final Set<Polygon> _polygons = HashSet<Polygon>();
  final Set<Polyline> _polyLines = HashSet<Polyline>();

  bool _drawSquareEnabled = false;
  List<LatLng> _userPolyLinesLatLngList = [];
  bool _clearDrawing = false;
  int? _lastXCoordinate, _lastYCoordinate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (_drawSquareEnabled) ? _onPanUpdate : null,
        onPanEnd: (_drawSquareEnabled) ? _onPanEnd : null,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          polygons: _polygons,
          polylines: _polyLines,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleDrawing,
        tooltip: 'Drawing',
        child: Icon((_drawSquareEnabled) ? Icons.cancel : Icons.edit),
      ),
    );
  }

  _toggleDrawing() {
    _clearPolygons();
    setState(() => _drawSquareEnabled = !_drawSquareEnabled);
  }

  _onPanUpdate(DragUpdateDetails details) async {
    // To start drawing a new square every time.
    if (_clearDrawing) {
      _clearDrawing = false;
      _clearPolygons();
    }

    if (_drawSquareEnabled) {
      late double x, y;
      if (Platform.isAndroid) {
        // Workaround for an issue with GoogleMaps package.
        x = details.globalPosition.dx * 3;
        y = details.globalPosition.dy * 3;
      } else if (Platform.isIOS) {
        x = details.globalPosition.dx;
        y = details.globalPosition.dy;
      }

      // Round the x and y.
      int xCoordinate = x.round();
      int yCoordinate = y.round();

      // Check if the distance between the last point is not too far.
      // To prevent two-finger drawing.
      if (_lastXCoordinate != null && _lastYCoordinate != null) {
        var distance = sqrt(pow(xCoordinate - _lastXCoordinate!, 2) + pow(yCoordinate - _lastYCoordinate!, 2));
        // Check if the distance of point and point is large.
        if (distance > 80.0) return;
      }

      // Cache the coordinates.
      _lastXCoordinate = xCoordinate;
      _lastYCoordinate = yCoordinate;

      ScreenCoordinate screenCoordinate = ScreenCoordinate(x: xCoordinate, y: yCoordinate);

      final GoogleMapController controller = await _controller.future;
      LatLng latLng = await controller.getLatLng(screenCoordinate);

      try {
        // Add the new point to the list.
        _userPolyLinesLatLngList.add(latLng);

        _polyLines.removeWhere((polyline) => polyline.polylineId.value == 'user_polyline');
        _polyLines.add(
          Polyline(
            polylineId: PolylineId('user_polyline'),
            points: _userPolyLinesLatLngList,
            width: 2,
            color: Colors.blue,
          ),
        );
      } catch (e) {
        print("Error painting: $e");
      }
      setState(() {});
    }
  }

  _onPanEnd(DragEndDetails details) async {
     // Reset the last cached coordinates.
    _lastXCoordinate = null;
    _lastYCoordinate = null;

    if (_drawSquareEnabled) {
      // Calculate the coordinates for the square based on the last drawn points.
      if (_userPolyLinesLatLngList.length >= 2) {
        LatLng firstPoint = _userPolyLinesLatLngList.first;
        LatLng secondPoint = _userPolyLinesLatLngList.last;
        
              double latDiff = secondPoint.latitude - firstPoint.latitude;
        double lngDiff = secondPoint.longitude - firstPoint.longitude;
        
        LatLng thirdPoint = LatLng(secondPoint.latitude + latDiff, secondPoint.longitude);
        LatLng fourthPoint = LatLng(firstPoint.latitude + latDiff, firstPoint.longitude);

        // Clear existing drawings.
        _polygons.clear();
        _polyLines.clear();

        // Draw the square.
        _polygons.add(
          Polygon(
            polygonId: PolygonId('user_polygon'),
            points: [
              firstPoint,
              secondPoint,
              thirdPoint,
              fourthPoint,
            ],
            strokeWidth: 2,
            strokeColor: Colors.blue,
            fillColor: Colors.blue.withOpacity(0.4),
          ),
        );

        setState(() {
          _clearDrawing = true;
        });
      }
    }
  }

  _clearPolygons() {
    setState(() {
      _polyLines.clear();
      _polygons.clear();
      _userPolyLinesLatLngList.clear();
    });
  }
}
