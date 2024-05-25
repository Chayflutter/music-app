import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;

final double radius;
  const NeuBox({super.key, required this.child, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius:BorderRadius.circular(radius) ,
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                blurRadius: 15,
                offset: const Offset(4, 4)),
            BoxShadow(
                color: Colors.grey.shade900,
                blurRadius: 15,
                offset: const Offset(-4, -4))
          ]),
      child: child,
      padding: EdgeInsets.all(12),
    );
  }
}
