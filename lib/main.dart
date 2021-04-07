import 'package:admibka/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:admibka/screens/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: TheatreTheme.dark().data,
      themeMode: ThemeMode.dark,
      home: SignUpPage(),
    );
  }
}
