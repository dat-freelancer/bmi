import 'package:flutter/material.dart';

class Neumophism extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;
  final double blurRadius;

  const Neumophism({
    super.key,
    required this.child,
    required this.color,
    this.radius = 0,
    this.blurRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            offset: const Offset(-6.0, -6.0),
            blurRadius: blurRadius,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: const Offset(6.0, 6.0),
            blurRadius: blurRadius,
            spreadRadius: 1,
          ),
        ],
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
