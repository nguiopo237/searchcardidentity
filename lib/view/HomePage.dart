import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../components/colors.dart';
import '../components/generated/assets.dart';
import '../components/popmenubutton.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(20.h),
          child: Container(
            color: Colors.black,
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         colors: [Colors.black, Colors.black.withOpacity(0.5)])),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Assets.imagesLogom,
                    height: 10.h,
                    width: 10.w,
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: TextFormField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "recherche",
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(8.0),
                    child: Wrap(
                      children: [
                        Popmenubutton(
                          text: 'HOME',
                          index: 'a',
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Popmenubutton(
                          text: 'PORTFOLIO',
                          index: 'b',
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Popmenubutton(
                          text: 'ABOUT',
                          index: 'c',
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Popmenubutton(
                          text: 'CONTACT',
                          index: 'c',
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         colors: [Colors.white, Colors.grey.withOpacity(0.5)])),
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
