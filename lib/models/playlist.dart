import 'package:flutter/material.dart';
import 'package:myapp/models/songs.dart';


class PlaylistProvider extends ChangeNotifier{
  
  final List <Songs> _playlist = [
    Songs(songName: 'songName', songPath: 'songPath', imagePath: 'assets/album.jpg'),
  ];



  int? _currentSongIndex;


  List <Songs> get playlist =>  _playlist;
  int? get currentSongIndex => _currentSongIndex;

  
}