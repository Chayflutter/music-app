// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/pages/homepage.dart';
// import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.dark(
                surface: Colors.grey.shade900,
                primary: Colors.grey.shade600,
                secondary: Colors.grey.shade800,
                inversePrimary: Colors.grey.shade300)),
        home: const Homepage());
  }
}
