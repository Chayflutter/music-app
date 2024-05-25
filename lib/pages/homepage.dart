import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/_myDrawer.dart';
import 'package:myapp/models/playlist.dart';
import 'package:myapp/models/songs.dart';
import 'package:myapp/pages/song_page.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  late final dynamic playlistProvider;

  @override
  void initState(){
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context,listen: false);
  }

Future<void> addFiles(value)async{
var path = await ExternalPath.getExternalStorageDirectories();

  value.task(path[0].toString());
}
  void gotosong(int songIndex){
    playlistProvider.currentSongIndex = songIndex;

    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SongPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('P L A Y L I S T'),
        backgroundColor: Colors.black.withOpacity(0.5),
        centerTitle: true,
        toolbarHeight: 60.2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      drawer: const Mydrawer(),
      body: Consumer<PlaylistProvider>(
        
        builder: (context, value, child) {
          addFiles(value);
          final List<Songs> playlist = value.playlist;
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final Songs song = playlist[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(song.songName),
                  leading: Image.asset(song.imagePath),onTap: ()=>gotosong(index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
