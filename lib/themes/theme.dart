import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'themes.dart';

class TheatreTheme {
  TheatreTheme({
    this.textStyles,
    this.colors,
    this.data,
  });

  final TheatreTextStyles textStyles;
  final TheatreColors colors;

  final ThemeData data;

  static TheatreTheme of(BuildContext context) {
    return Get.isDarkMode ? dark() : light();
  }

  // ignore: prefer_constructors_over_static_methods
  static TheatreTheme light() {
    return TheatreTheme(
      textStyles: TheatreTextStyles(
        text: const TextStyle(color: Colors.black, fontSize: 14),
        smallText: const TextStyle(color: Colors.black, fontSize: 12),
        title: const TextStyle(color: Colors.black, fontSize: 30),
        smallTitle: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      colors: TheatreColors(
        accentColor: Colors.greenAccent,
        secondAccentColor: Colors.blueAccent,
        blackColor: Colors.black,
        backgroundCardColor: Colors.red,
        borderCardColor: Colors.blue,
      ),
      data: ThemeData.light(),
    );
  }

  // ignore: prefer_constructors_over_static_methods
  static TheatreTheme dark() {
    return TheatreTheme(
      textStyles: TheatreTextStyles(
        text: const TextStyle(color: Colors.white, fontSize: 14),
        smallText: const TextStyle(color: Colors.white, fontSize: 12),
        title: const TextStyle(color: Colors.white, fontSize: 30),
        smallTitle: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      colors: TheatreColors(
        accentColor: Colors.greenAccent,
        secondAccentColor: Colors.blueAccent,
        blackColor: Colors.black,
        borderCardColor: Colors.red,
        backgroundCardColor: Colors.blue,
      ),
      data: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}
