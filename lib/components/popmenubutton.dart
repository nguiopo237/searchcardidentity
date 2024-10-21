import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:searchcardidentity/components/service/controlleur.dart';
import 'package:searchcardidentity/components/style/monsera.dart';



import '../view/Registration/registerprofile.dart';
import 'appconfig.dart';
import 'colors.dart';

class Popmenubutton extends StatefulWidget {
  final String text;
  final String index;
  final List<String>? item;

    Popmenubutton({super.key, required this.text, this.item, required this.index});

  @override
  State<Popmenubutton> createState() => _PopmenubuttonState();
}

class _PopmenubuttonState extends State<Popmenubutton> {
  bool select = false;
  bool selectone = false;

  onselect(){
    print("up");
    setState(() {
      select =true;
    });
  }
  offselect(){
    setState(() {
      select =false;
    });
  }

   Controlleur c = Get.put(Controlleur());

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        onselect();
      },
      onExit: (event) {
        offselect();
      },
      child: PopupMenuButton<String>(tooltip: widget.text,

        onOpened: () {


        setState(() {
          selectone = true;
        });
        print("is open");
        },
        onCanceled: () {
          setState(() {
            selectone = false;
          });
          print("is came");
        },


        position: PopupMenuPosition.under,
        child: InkWell(
          onTap:widget.index=="d"?null :() {
            Get.to(Registerprofile());
            // c.scrollToId!.animateTo(widget.index, duration: Duration(milliseconds: 1000), curve: Curves.decelerate);
          },
          child: Monserat(
            text: widget.text,
            color: select==false&&selectone==false?Colors.white:primaryDark,
            size: 14.sp,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
        ),
        onSelected: (String selectedValue) {
          print('Selection : $selectedValue');
        },
        enabled: true,
        offset: Offset(30, 0),
        itemBuilder: (BuildContext context) {
          return widget.item!.map((String item) {
            return PopupMenuItem<String>(
              value: item,
              child: Monserat(
                text: item,
                textAlign: TextAlign.center,
                color: Colors.amber,
                size: 16.px,
                fontWeight: FontWeight.w600,
              ),
            );
          }).toList();
        },
      ),
    );
  }
}
