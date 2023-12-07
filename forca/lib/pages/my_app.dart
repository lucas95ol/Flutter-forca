import 'package:flutter/material.dart';
import 'package:forca/pages/main_page.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/mainPage',
      routes: {
        '/mainPage':(context) => MainPage(),
      },
    );
  }
}
