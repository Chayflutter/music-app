import 'package:flutter/material.dart';
import 'package:myapp/components/neu_box.dart';
import 'package:myapp/models/playlist.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
                        Text('P L A Y L I S T'),
                        IconButton(onPressed: (){}, icon: Icon(Icons.menu))
                      ],)
                    ],
                  ),
                ),
              ),
            ));
  }
}
