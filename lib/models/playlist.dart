import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/models/songs.dart';

class PlaylistProvider extends ChangeNotifier {
  List<Songs> _playlist = [];
  bool truth = false;
  task() {
    var directory = Directory('/storage/emulated/0/');
    List<FileSystemEntity> files;
    files = directory.listSync(recursive: true, followLinks: false);
    for (FileSystemEntity entity in files) {
      String path = entity.path;
      if (path.endsWith('.mp3')) {
        if(truth==false){

        _playlist.add(
          Songs(
              songName: entity.path.split('/').last.split('.').first,
              songPath: entity.path,
              imagePath: 'assets/images/album.jpg'),
        );
        truth = true;
        }
      }
    }
  }

  int? _currentSongIndex;

  List<Songs> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  set currentSongIndex(int? newIndex){
    _currentSongIndex = newIndex;
    notifyListeners();
  }
}
