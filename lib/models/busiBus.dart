// Properties to inset(store it) to the firebase DB
class BusiBus {
  int? busNumber;
  int? busCapacity;
  int? busPlate;

  BusiBus({this.busNumber, this.busCapacity, this.busPlate});
  // To Json (use it in Create)
  Map<String, dynamic> toJson() => {
        // Fields      keys
        'bus_number': busNumber,
        'bus_capacity': busCapacity,
        'bus_plate': busPlate,
      };

  // From Json (use it in Read)
  static BusiBus fromJson(Map<String, dynamic> json) => BusiBus(
        //  in class         in firebase
        busNumber: json['bus_number'],
        busCapacity: json['bus_capacity'],
        busPlate: json['bus_plate'],
      );
}
