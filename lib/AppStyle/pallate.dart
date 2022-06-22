import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff04081e, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff1d2135), //10%
      100: Color(0xff36394b), //20%
      200: Color(0xff4f5262), //30%
      300: Color(0xff686b78), //40%
      400: Color(0xff82848f), //50%
      500: Color(0xff9b9ca5), //60%
      600: Color(0xffb4b5bc), //70%
      700: Color(0xffcdced2), //80%
      800: Color(0xffe6e6e9), //90%
      900: Color(0xffffffff), //100%
    },
  );
}
