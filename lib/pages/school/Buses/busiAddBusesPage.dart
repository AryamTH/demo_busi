import 'package:demo_busi/models/busiBus.dart';
import 'package:demo_busi/thems/busiTextWidgets.dart';
import 'package:demo_busi/services/busiFirebase_crud.dart';

import 'package:flutter/material.dart';
import 'package:demo_busi/busiGoogleMapAreas.dart';

class BusiAddBusesPage extends StatefulWidget {
  const BusiAddBusesPage({super.key});

  @override
  State<BusiAddBusesPage> createState() => _BusiAddBusesPageState();
}

class _BusiAddBusesPageState extends State<BusiAddBusesPage> {
  final BusiFirebase_crud firebaseCrud = BusiFirebase_crud();
  // Text editing Controller
  final busPlateController = TextEditingController();
  final busNumberController = TextEditingController();
  final busCapacityController = TextEditingController();

  // use flutter validation (Glapal key)
  // type: form state -> use to identify our form
  final _formKey = GlobalKey<FormState>();

  // text field state
  String? busPlate;
  String? busNumber;
  String? busCapacity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000388),
        //هذي عشان نسوي لها زاويه من اليمين واليسار
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
        leading: BackButton(
          color: Colors.white,
        ),
        //use onPressed to go back (previouce page)
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Form(
            // assosite our form with key.
            // to track the state of our form + validate
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        child: Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.fromLTRB(0, 100, 20, 0),
                          child: BusiTextWidget(
                            text: 'لاضافه الباص في النظام',
                            size: 18,
                          ),
                        ),
                      ),

                      //________________________________________________________
                      // First Text
                      Container(
                        padding: EdgeInsets.fromLTRB(189, 25, 0, 0),
                        child: BusiTextWidget(
                          text: 'رقم اللوحة',
                          size: 11,
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          width: 265,
                          height: 37,
                          child: TextFormField(
                            // Attach controller to text fiels
                            controller: busNumberController,
                            // func to see if it's valid or not return null or string(helper text)
                            // if reicive null then it's not emty and the func in onPressed will be true
                            validator: (val) =>
                                val!.isEmpty ? 'Enter the bus plate' : null,
                            // represent what in the textformfield ! when user write something the function run
                            onChanged: (val) {
                              setState(() => busPlate = val);
                            },
                            //____________________
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE9EEFE),
                              //  border for enabled state (default) "قبل يبدا اليوزر يكتب"
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffE9EEFE)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              //  border for focused state (اذا ضغط عليها اليوزر وبدا يكتب)
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xff000388)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              // for more action in textField: https://www.kindacode.com/article/customize-borders-of-textfield-textformfield-in-flutter/
                            ), //______________________________
                          ),
                        ),
                      ),

                      //________________________________________________________
                      // Secound Text
                      Container(
                        padding: EdgeInsets.fromLTRB(189, 10, 0, 0),
                        child: BusiTextWidget(
                          text: 'رقم الباص',
                          size: 11,
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          width: 265,
                          height: 37,
                          child: TextFormField(
                            // Attach controller to text fiels
                            controller: busPlateController,
                            //
                            validator: (val) =>
                                val!.isEmpty ? 'Enter the bus plate' : null,
                            // represent what in the textformfield ! when user write something the function run
                            onChanged: (val) {
                              setState(() => busNumber = val);
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE9EEFE),
                              //  border for enabled state (default) "قبل يبدا اليوزر يكتب"
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffE9EEFE)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              //  border for focused state (اذا ضغط عليها اليوزر وبدا يكتب)
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xff000388)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              // for more action in textField: https://www.kindacode.com/article/customize-borders-of-textfield-textformfield-in-flutter/
                            ), //______________________________
                          ),
                        ),
                      ),

                      //________________________________________________________
                      // Third Text
                      Container(
                        padding: EdgeInsets.fromLTRB(155, 10, 0, 0),
                        child: BusiTextWidget(
                          text: 'السعه (عدد الطلاب)',
                          size: 11,
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          width: 265,
                          height: 37,
                          child: TextFormField(
                            // Attach controller to text fiels
                            controller: busCapacityController,
                            //
                            validator: (val) =>
                                val!.isEmpty ? 'Enter bus the capacity' : null,
                            // represent what in the textformfield ! when user write something the function run
                            onChanged: (val) {
                              setState(() => busCapacity = val);
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE9EEFE),
                              //  border for enabled state (default) "قبل يبدا اليوزر يكتب"
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffE9EEFE)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              //  border for focused state (اذا ضغط عليها اليوزر وبدا يكتب)
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xff000388)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              // for more action in textField: https://www.kindacode.com/article/customize-borders-of-textfield-textformfield-in-flutter/
                            ), //______________________________
                          ),
                        ),
                      ),

                      //________________________________________________________
                      // Fourth Text
                      Container(
                        padding: EdgeInsets.fromLTRB(155, 10, 0, 0),
                        child: BusiTextWidget(
                          text: 'تحديد منطقه للباص',
                          size: 11,
                        ),
                      ),
                      // Map Inside sized box Text
                      // SizedBox(
                      Stack(
                        children: [
                          // Container with BusiGoogleMapAreas
                          Container(
                            width: 282,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            // Ensure that the Container's child does not affect its size or borderRadius
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  14), // Match the Container's borderRadius
                              child: BusiGoogleMapAreas(),
                            ),
                          ),
                          // ElevatedButton aligned to bottom-left corner
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                              width: 160, // <-- Your width
                              height: 28,
                              child: ElevatedButton(
                                //STYLE THE BUTTON
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                //Required (must put it in the ElevatedButton widget!)
                                child: Text(
                                  'لتحديد المنطقه اضغط هنا',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0Xff000388),
                                  ),
                                ),
                                onPressed: () async {
                                  Navigator.pushNamed(
                                      context, '/busiBusAreasPage');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      //________________________________________________________
                      // Bottom
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: 93,
                          height: 37,
                          child: ElevatedButton(
                              //STYLE THE BUTTON
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Color(0Xff000388),
                              ),
                              //Required (must but it in theElevatedButton widget!)
                              child: const Text(
                                'اضافه',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                // if check T -> theis is valide so we can execute the code and send it to firebase
                                // if F not valide
                                // how knoe if valide or not? we add some ptoprtiyies in textfield to know
                                if (_formKey.currentState!.validate()) {
                                  // create new user obj then accses to all our controller so we accese to text field
                                  final busAdd = BusiBus(
                                    busPlate:
                                        int.parse(busNumberController.text),
                                    busNumber:
                                        int.parse(busPlateController.text),
                                    busCapacity:
                                        int.parse(busCapacityController.text),
                                  );
                                  firebaseCrud.createBus(busAdd: busAdd);

                                  Navigator.pushNamed(
                                      context, '/busiBusCardPage');
                                }
                                print(busPlate);
                                print(busNumber);
                                print(busCapacity);
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//تحديد منطقه للباص: