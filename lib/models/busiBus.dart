import 'package:google_maps_flutter/google_maps_flutter.dart';

// Properties to inset(store it) to the firebase DB
class BusiBus {
  int? busNumber;
  int? busCapacity;
  int? busPlate;
  List<LatLng>? coordinates; // Add LatLng coordinates

  BusiBus({this.busNumber, this.busCapacity, this.busPlate, this.coordinates});
  // To Json (use it in Create)
  Map<String, dynamic> toJson() => {
        // Fields      keys
        'bus_number': busNumber,
        'bus_capacity': busCapacity,
        'bus_plate': busPlate,
        'coordinates': coordinates != null
            ? coordinates!
                .map((LatLng latLng) => {
                      'latitude': latLng.latitude,
                      'longitude': latLng.longitude
                    })
                .toList()
            : null,
      };

  // From Json (use it in Read)
  static BusiBus fromJson(Map<String, dynamic> json) {
    List<LatLng>? coordinates = [];
    if (json['coordinates'] != null) {
      List<dynamic> jsonCoordinates = json['coordinates'];
      coordinates = jsonCoordinates
          .map((dynamic item) =>
              LatLng(item['latitude'] as double, item['longitude'] as double))
          .toList();
    }
    return BusiBus(
      busNumber: json['bus_number'],
      busCapacity: json['bus_capacity'],
      busPlate: json['bus_plate'],
      coordinates: coordinates,
    );
  }
}
