// WRAPPER
import 'package:demo_busi/models/busiBus.dart';
import 'package:demo_busi/services/busiFirebase_crud.dart';
import 'package:demo_busi/thems/busiTextWidgets.dart';
import 'package:flutter/material.dart';

class BusiBusCardPage extends StatelessWidget {
  BusiBusCardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000388),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          StreamBuilder<List<BusiBus>>(
            stream: BusiFirebase_crud().busRead(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final buses = snapshot.data!;
                return ListView(
                  children: buses.map(buildBus).toList(),
                );
              } else {
                // Placeholder widget when data is loading or unavailable
                return Center(
                  child: CircularProgressIndicator(), // Or any other widget
                );
              }
            },
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 324,
              height: 167,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/busiAddBusesPage');
                },
                child: Card(
                  color: Color(0xffD2E0F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(110, 35, 0, 0),
                          child: BusiTextWidget(
                            text: 'اضافة باص',
                            size: 20,
                          ),
                        ),
                      ),
                      // Image
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
                        child: SizedBox(
                          width: 83, // Adjust width as needed
                          height: 83,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Image(
                              image: AssetImage(
                                'lib/school/Buses/BusPageImages/add_bus.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBus(BusiBus bus) => Container(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 324,
          height: 167,
          child: Card(
            color: Color(0xffD2E0F8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(110, 35, 0, 0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${bus.busPlate}'),
                      ),
                      title: Text(bus.busNumber.toString()),
                      subtitle: Text(bus.busCapacity.toString()),
                    ),
                  ),
                ),
                // Image
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
                  child: SizedBox(
                    width: 83, // Adjust width as needed
                    height: 83,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image(
                        image: AssetImage(
                          'lib/school/Buses/BusPageImages/add_bus.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
