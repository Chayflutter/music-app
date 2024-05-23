import 'package:flutter/material.dart';
import 'package:myapp/components/myDrawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  
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
      
    );
  }
}
