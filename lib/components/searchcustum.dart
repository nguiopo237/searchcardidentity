import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:searchcardidentity/components/service/controlleur.dart';

import '../service/callapi.dart';
import 'colorapp.dart';

class SearchField extends StatefulWidget {
  final Function(String)? onchange;
  final TextEditingController? textEditingController;

  const SearchField({
    Key? key, this.onchange, this.textEditingController,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  Controlleur c = Get.find();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,

      onChanged:widget.onchange ,
      controller: widget.textEditingController,


      decoration: InputDecoration(

        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),

        hintText: "Search",
        fillColor: ColorApp.secondaryColor.withOpacity(0.5),
        filled: true,

        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {

            API.getalluser();
          },

          child: Container(
            padding: EdgeInsets.all(ColorApp.defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: ColorApp.defaultPadding / 2),
            decoration: BoxDecoration(
              color: ColorApp.primaryColor.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),

      ),
    );
  }
}