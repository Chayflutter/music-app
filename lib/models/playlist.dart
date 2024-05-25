import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
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


final AudioPlayer _audioPlayer = AudioPlayer();

Duration _currentDuration = Duration.zero;
Duration _totalDuration = Duration.zero;


PlaylistProvider(){listenToDuration();}

bool _isPlaying = false;

void play ()async{
  final String path = _playlist[currentSongIndex!].songPath;
  await _audioPlayer.stop();
  await _audioPlayer.play(AssetSource(path));
  _isPlaying = true;
  notifyListeners();
}
void pause ()async{
  
  await _audioPlayer.pause();
  _isPlaying = false;
  notifyListeners();
}
void resume ()async{
  
  await _audioPlayer.resume();
  _isPlaying = true;
  notifyListeners();
}
void pauseOrResume ()async{
  if(_isPlaying){
    pause();
  }else{resume();}
}
void seek (Duration position)async{
  
  await _audioPlayer.seek(position);
}
void playNextSong ()async{
  
  if(_currentSongIndex != null){
    if(_currentSongIndex! < _playlist.length-1){
      _currentSongIndex = _currentSongIndex! + 1;
    }else{

      _currentSongIndex = 0;
    }
  }
}
void playPreviousSong ()async{
  
  if(_currentDuration.inSeconds >2){
    if(_currentSongIndex! < _playlist.length-1){
      
    }else{

      if(_currentSongIndex!>0){
        currentSongIndex = _currentSongIndex!-1;
      }else{
        currentSongIndex = _playlist.length-1;
      }
    }
  }
}

void listenToDuration(){
_audioPlayer.onDurationChanged.listen((event){
  _totalDuration = event;
  notifyListeners();
});

_audioPlayer.onPositionChanged.listen((event){
  _currentDuration = event;
  notifyListeners();
});

_audioPlayer.onPlayerComplete.listen((event){playNextSong();

});
}

  List<Songs> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  set currentSongIndex(int? newIndex){
    _currentSongIndex = newIndex;
    notifyListeners();
  }
}
