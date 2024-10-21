import 'package:flutter/material.dart';

import 'package:searchcardidentity/components/style/monsera.dart';

import 'animation/animationwidget.dart';

class Describeservice extends StatelessWidget {
  final String ?title;
  final String ?title1;
  final String ?title2;
  final String ?title3;
  const Describeservice({super.key, this.title = "",this.title1 = "",this.title2,this.title3});

  @override
  Widget build(BuildContext context) {
    return    Delatanimationwidget(
      delay: 500,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Monserat(text: title.toString(),fontWeight: FontWeight.bold,),
            Monserat(text: title1.toString(),fontWeight: FontWeight.w300,),
            Monserat(text: title2.toString(),fontWeight: FontWeight.w300,),
            ElevatedButton(onPressed: () {

            }, child: Monserat(text: 'En savoir plus',))
          ],),
      ),
    );
  }
}
