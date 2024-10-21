import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'dart:html';

import '../../model/usermodel.dart';
import '../../service/callapi.dart';



class Controlleur extends GetxController {
  int indexheader = 0;
  int value = 0;
  TextEditingController phone = TextEditingController();
  bool valuephone = false;
  ScrollToId? scrollToId;
  RxList<Usersearch>usersearch =<Usersearch>[].obs;


  downloadFile(url) {
    AnchorElement anchorElement =  AnchorElement(href: url);
    anchorElement.download = "R237mobileapp";
    anchorElement.click();
  }


  getuser() async{
    usersearch.clear;
    var data= await API.getalluser();
    if(data!=null){
      usersearch.add(Usersearch.fromJson(data));
      print(usersearch.first.status);
      print(usersearch.length);
      update();

    }
  }

  search(name) async{
    usersearch.clear;
    var data= await API.searchdata(name);
    if(data!=null){
      usersearch.clear;
      usersearch.add(Usersearch.fromJson(data));
      print(usersearch.first.status);
      print(usersearch.length);


    }
    }

    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getuser();
  }




}
