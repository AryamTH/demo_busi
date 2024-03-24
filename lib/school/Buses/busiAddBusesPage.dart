import 'package:demo_busi/Widgets/busiCardsWidgets.dart';
import 'package:demo_busi/widgets/BusiTextFieldsWidgets.dart';
import 'package:demo_busi/widgets/busiButtonsWidgets.dart';
import 'package:demo_busi/widgets/busiTextFieldsFormsWidgets.dart';
import 'package:demo_busi/widgets/busiTextWidgets.dart';
import 'package:flutter/material.dart';
import 'package:demo_busi/busiGoogleMapAreas.dart';
import 'package:demo_busi/BusiGoogleMap.dart';
import 'package:flutter/widgets.dart';

class BusiAddBusesPage extends StatefulWidget {
  const BusiAddBusesPage({super.key});

  @override
  State<BusiAddBusesPage> createState() => _BusiAddBusesPageState();
}

class _BusiAddBusesPageState extends State<BusiAddBusesPage> {
  // text field state
  String? busPlate;
  String? busNumber;
  String? basCapacity;

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
                              borderSide: BorderSide(color: Color(0xffE9EEFE)),
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
                          // represent what in the textformfield ! when user write something the function run
                          onChanged: (val) {
                            setState(() => busNumber = val);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffE9EEFE),
                            //  border for enabled state (default) "قبل يبدا اليوزر يكتب"
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE9EEFE)),
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
                          // represent what in the textformfield ! when user write something the function run
                          onChanged: (val) {
                            setState(() => basCapacity = val);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffE9EEFE),
                            //  border for enabled state (default) "قبل يبدا اليوزر يكتب"
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE9EEFE)),
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
                                print(busPlate);
                                print(busNumber);
                                print(basCapacity);
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
                            child: Text(
                              'اضافه',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              print(busPlate);
                              print(busNumber);
                              print(basCapacity);
                              Navigator.pushNamed(context, '/busiBusCardPage');
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
    );
  }
}

//تحديد منطقه للباص: