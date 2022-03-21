import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoonz_mobile/screens/login_screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: home(),
    );
  }

  Widget home() {
    return LoginScreen();
  }
}
