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
        scrollDirection: Axis.vertical,
        children: [
          // first card
          Container(
            child: StreamBuilder<List<BusiBus>>(
              stream: BusiFirebase_crud().busRead(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final buses = snapshot.data!;
                  return Column(
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
          ),

          // secound card
          Container(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
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
                          padding: const EdgeInsets.fromLTRB(110, 35, 0, 0),
                          child: const BusiTextWidget(
                            text: 'اضافة باص',
                            size: 20,
                          ),
                        ),
                      ),
                      // Image
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
                        child: const SizedBox(
                          width: 83, // Adjust width as needed
                          height: 83,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Image(
                              image: AssetImage(
                                'lib/pages/school/Buses/BusPageImages/add_bus.png',
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
        child: SizedBox(
          width: 324,
          height: 167,
          child: Card(
            color: Color(0xffD2E0F8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row at top right
                Container(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Add from firebase (:
                            BusiTextWidget(text: 'رقم الباص: ${bus.busNumber}'),
                            BusiTextWidget(
                                text: 'عدد الطلاب: ${bus.busCapacity}'),
                            BusiTextWidget(text: 'رقم اللوحه: ${bus.busPlate}'),
                          ],
                        ),
                      ),
                      // Image
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: SizedBox(
                          width: 72, // Adjust width as needed
                          height: 72,
                          child: Image(
                            image: AssetImage(
                              'lib/pages/school/Buses/BusPageImages/bus-school2.png',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Button at bottom center
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 116,
                      height: 46,
                      child: ElevatedButton(
                        //STYLE THE BUTTON
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Color(0XffEAEFFF),
                        ),
                        //Required (must but it in the ElevatedButton widget!)
                        child: const Text(
                          'المنطقه للباص',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0Xff000388),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          //  Navigator.pushNamed(context, '/busiAddBusesPage');
                        },
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
