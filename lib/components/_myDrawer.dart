import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
            child: Icon(Icons.music_note
            ,size: 40,
            color: Theme.of(context).colorScheme.inversePrimary,),
          )),
      
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25, right: 10),
          child: ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('H O M E'),
            leading: const Icon(Icons.home),
            onTap: ()=> Navigator.pop(context) ,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 0, right: 10),
          child: ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('S E T T I N G S'),
            leading: const Icon(Icons.settings),
            onTap: (){},
          ),
        ),
        ],

      
      ),
    );
  }
}
