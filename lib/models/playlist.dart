import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/models/songs.dart';

class PlaylistProvider extends ChangeNotifier {
  List<Songs> _playlist = [
    Songs(
        songName: 'songName',
        songPath: 'songPath',
        imagePath: 'assets/images/album.jpg'),
  ];

  task() {
    var directory = Directory('/storage/emulated/0/');
    List<FileSystemEntity> files;
    files = directory.listSync(recursive: true, followLinks: false);
    for (FileSystemEntity entity in files) {
      String path = entity.path;
      if (path.endsWith('.mp3')) {
        _playlist.add(
          Songs(
              songName: 'testing',
              songPath: entity.path,
              imagePath: 'assets/images/album.jpg'),
        );
      }
    }
  }

  int? _currentSongIndex;

  List<Songs> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
}
