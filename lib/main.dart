import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String textthing = 'something';


  void task() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      var directory = Directory('/storage/emulated/0/');
      List<FileSystemEntity> files;
      List<FileSystemEntity> songs = [];
      files = directory.listSync(recursive: true, followLinks: false);
      for (FileSystemEntity entity in files) {
        String path = entity.path;
        if (path.endsWith('.mp3')) songs.add(entity);
      }

      setState(() {
        textthing = songs.toString();
      });
      }
    //     print(songs);
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textthing,
                style: TextStyle(fontSize: 30),
              ),
              ElevatedButton(onPressed: task, child: Text('asjkd'))
            ],
          ),
        ),
      ),
    );
  }
}
