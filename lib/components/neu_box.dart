import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;

final double radius;
  const NeuBox({super.key, required this.child, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius:BorderRadius.circular(radius) ,
          boxShadow: [
            const BoxShadow(
                color: Colors.black,
                blurRadius: 15,
                offset: Offset(4, 4)),
             BoxShadow(
                color: Colors.grey.shade900,
                blurRadius: 15,
                offset:const  Offset(-4, -4))
          ]),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
