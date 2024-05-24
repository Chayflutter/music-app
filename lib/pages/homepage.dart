import 'package:flutter/material.dart';
import 'package:myapp/components/myDrawer.dart';
import 'package:myapp/models/playlist.dart';
import 'package:myapp/models/songs.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('P L A Y L I S T'),
        backgroundColor: Colors.black.withOpacity(0.5),
        
        centerTitle: true,
        toolbarHeight: 60.2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        
      ),
      drawer: Mydrawer(),
      body: Consumer<PlaylistProvider>(builder: (context, value,child){
        value.task();
        final List<Songs> playlist = value.playlist;
        return ListView.builder(
          itemCount: playlist.length,
          itemBuilder: (context, index){
            final Songs song = playlist[index];
            return ListTile(title: Text(song.songName),);
          },
        );
      },),
      
    );
  }
}
