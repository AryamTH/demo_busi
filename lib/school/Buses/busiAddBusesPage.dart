import 'package:demo_busi/Widgets/busiCardsWidgets.dart';
import 'package:demo_busi/widgets/BusiTextFieldsWidgets.dart';
import 'package:demo_busi/widgets/busiButtonsWidgets.dart';
import 'package:demo_busi/widgets/busiTextWidgets.dart';
import 'package:flutter/material.dart';
import 'package:demo_busi/BusiGoogleMap.dart';

class BusiAddBusesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                child: BusiTextFieldWidget(),
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
                child: BusiTextFieldWidget(),
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
                child: BusiTextFieldWidget(),
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
              SizedBox(
                width: 282,
                height: 100,
                child: BusiGoogleMap(),
              ),
              //________________________________________________________
              // Bottom
              Container(
                padding: EdgeInsets.only(top: 20),
                child: BusiButtonDarkWidget(
                    textOnButton: 'اضافه', onPressed: () {}),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//تحديد منطقه للباص: