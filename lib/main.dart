import 'package:flutter/material.dart';
import 'package:smart_menu/page/homePage/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Smart Menu',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey,
      accentColor: Colors.limeAccent,
      fontFamily: 'Raleway',
      cardTheme: CardTheme(
        color: Colors.grey[600],
        shadowColor: Colors.black,
        margin: const EdgeInsets.all(10)
      )
    ),
    home: Home(),
  ));
}
