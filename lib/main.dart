import 'package:flutter/material.dart';
import 'package:ovo_app/helper.dart';
import 'package:ovo_app/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primaryColor: HexColor("#01579b"),
        primaryColorDark: HexColor("#002f6c"),
        primaryColorLight: HexColor("#4f83cc"),
      ),
      home: HomePage(),
    );
  }
}


