import 'package:flutter/material.dart';

const Color backGroundColor_dark = Color(0xFF1E1E1E);

const Color cardColor_dark = Color(0xFF252525);

const Color textColor_dark = Color(0xFFD9D9D9);

const Color accentColor_blue = Color(0xFF50BED3);
const Color accentColor_red = Color(0xFFFF785E);
const Color accentColor_green = Color(0xFF69CA87);

const TextStyle textStyle_dark = TextStyle(
  fontFamily: 'NunitoSans',
  color: textColor_dark,
);

const TextStyle tabletextStyle_dark = TextStyle(
  fontFamily: 'NunitoSans',
  color: textColor_dark,
  fontSize: 12.0,
);

const TextStyle cardHeading_textStyle = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w800,
    fontSize: 26.0,
    color: textColor_dark);

const TextStyle cardsubHeading_textStyle = TextStyle(
  fontFamily: 'NunitoSans',
  fontWeight: FontWeight.w700,
  color: textColor_dark,
  fontSize: 20.0,
);

const TextStyle cardData_textStyle = TextStyle(
  fontFamily: 'NunitoSans',
  color: textColor_dark,
);

const TextStyle kstateCard_textStyle = TextStyle(
  fontFamily: 'NunitoSans',
);

//Table View Styling
const TextStyle kTextViewHeading = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
);

const TextStyle kTextViewData = TextStyle(
  fontSize: 12.0,
);

class Essentials {
  static String toReadableInt(String number) {
    if (number == null) {
      return '';
    } else if (number.length <= 3) {
      return number;
    } else {
      String formattedString = '';
      if (number.length % 2 == 0) {
        formattedString = '${number[0]},';
        for (int i = 1; i < number.length - 4; i = i + 2) {
          formattedString = '$formattedString${number[i]}${number[i + 1]},';
        }
      } else {
        for (int i = 0; i < number.length - 4; i = i + 2) {
          formattedString = '$formattedString${number[i]}${number[i + 1]},';
        }
      }
      formattedString =
          '$formattedString${number.substring(number.length - 3, number.length)}';
      return formattedString;
    }
  }
}

const String kNewsAPIKey = '3a30d0b107184294a6b3a81c06ee8a3d';
