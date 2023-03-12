import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData.light(useMaterial3: true).copyWith(
      primaryColor: Colors.white,
      appBarTheme: appBarTheme,
    );

ThemeData get darkTheme => ThemeData.dark(useMaterial3: true).copyWith(
      appBarTheme: appBarTheme,
    );

AppBarTheme get appBarTheme => const AppBarTheme(elevation: 0);
