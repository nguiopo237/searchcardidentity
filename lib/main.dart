import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';


import 'package:responsive_framework/responsive_framework.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchcardidentity/view/HomePage.dart';
import 'package:searchcardidentity/view/Registration/registerprofile.dart';

import 'components/service/controlleur.dart';



void main() {
  Controlleur c = Get.put(Controlleur());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {

      return GetMaterialApp(


        builder: (context, widget) => ResponsiveBreakpoints.builder(
          child: Builder(builder: (context) {
            return ResponsiveScaledBox(
                width: ResponsiveValue<double?>(context,
                    defaultValue: null,
                    conditionalValues: [
                      Condition.equals(name: 'MOBILE_SMALL', value: 480),
                    ]).value,
                child: ClampingScrollWrapper.builder(context, widget!));
          }),
          breakpoints: [
            const Breakpoint(start: 0, end: 480, name: 'MOBILE_SMALL'),
            const Breakpoint(start: 481, end: 850, name: MOBILE),
            const Breakpoint(start: 850, end: 1080, name: TABLET),
            const Breakpoint(start: 1081, end: double.infinity, name: DESKTOP),
          ],
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  Homepage(),
      );
    });
  }
}


