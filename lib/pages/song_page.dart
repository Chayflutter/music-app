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
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)),
                          Text('P L A Y L I S T'),
                          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
                        ],
                      ),
                      const SizedBox(height: 25,),
                      NeuBox(
                        radius: 12,
                          child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset('assets/images/album.jpg')),
                          const Padding(
                            padding:  EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'data',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text('data'),
                                  ],
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('0:00'),
                                Icon(Icons.shuffle),
                                Icon(Icons.repeat),
                                Text('0:00'),
                              ],
                            ),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 7)),
                            child: Slider(
                              min: 0,
                              max: 100,
                              value: 50,
                              activeColor: Colors.deepPurpleAccent,
                              onChanged: (value) {},
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {},
                                  child:
                                      NeuBox(child: Icon(Icons.skip_previous), radius: 25,))),
                          const SizedBox(width: 25,),
                          Expanded(
                            flex: 2,
                              child: GestureDetector(
                                  onTap: () {},
                                  child:
                                      NeuBox(child: Icon(Icons.play_arrow) ,radius: 15))),
                          const SizedBox(width: 25,),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {},
                                  child:
                                      NeuBox(child: Icon(Icons.skip_next),radius: 25))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
