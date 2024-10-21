import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:searchcardidentity/components/typography.dart';


const Color primary = Color(0xFF002c2d);
const Color primaryDark = Color(0xFF14cec3);
const Color primaryLight = Color(0xFFeefbff);
const Color textSecondary = Color(0xFF3A3A3A);

const Color textPrimary = Color(0xFF4A4A4A);

const Color buttonPrimaryDark = Color(0xFF0075E6);
const Color buttonPrimaryDarkPressed = Color(0xFF006ED9);
const Color buttonPrimaryPressedOutline = Color(0xFF8DCDFD);

const Color background = Color(0xFFF8F9FA);
const Color backgroundDark = Color(0xFF303c42);
const Color border = Color(0x20000000);

ButtonStyle? menuButtonStyle = TextButton.styleFrom(
    foregroundColor: textSecondary,
    backgroundColor: Colors.transparent,
    disabledForegroundColor: const Color.fromRGBO(
        0, 0, 0, 0.38), // Replace null with desired color and opacity
    textStyle: buttonTextStyle,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16));
