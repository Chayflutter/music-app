// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/models/playlist.dart';
import 'package:myapp/pages/homepage.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => PlaylistProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkstatus() async {
    var status = await Permission.storage.request();
    return status.isGranted;
  }

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
        home: FutureBuilder<bool>(
          future: checkstatus(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              return Homepage();
            } else {
              return Scaffold(
                body: Text('Something went wrong'),
              );
            }
          },
        ));
  }
}
