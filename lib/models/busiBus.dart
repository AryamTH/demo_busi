// Properties to inset(store it) to the firebase DB
class BusiBus {
  int? busPlate;
  int? busNumber;
  int? busCapacity;

  BusiBus({this.busNumber, this.busCapacity, this.busPlate});

  Map<String, dynamic> toJson() => {
        // Fields      keys
        'bus_plate': busPlate,
        'bus_number': busNumber,
        'bus_capacity': busCapacity,
      };
}
