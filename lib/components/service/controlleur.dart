import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'dart:html';



class Controlleur extends GetxController {
  int indexheader = 0;
  int value = 0;
  TextEditingController phone = TextEditingController();
  bool valuephone = false;
  ScrollToId? scrollToId;


  downloadFile(url) {
    AnchorElement anchorElement =  AnchorElement(href: url);
    anchorElement.download = "R237mobileapp";
    anchorElement.click();
  }

}
