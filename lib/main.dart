import 'package:flutter/material.dart';
import 'package:practice/widgets/Expenses.dart';


void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
    runApp(MaterialApp(
theme:ThemeData().copyWith(
  elevatedButtonTheme:ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeData().primaryColor,
        foregroundColor: Colors.white
      )),
  cardTheme:const CardTheme().copyWith(
      color: ThemeData().colorScheme.primary.withOpacity(0.50),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
    textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: ThemeData().colorScheme.primary,
            fontSize: 16))),
      home: const Expenses(),
    ));
  // });
}
