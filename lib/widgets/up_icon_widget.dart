import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        final bottom = 70.0 - 8.0;
        return Positioned(
          bottom: bottom,
          top: size.height / 2 * (1 - animation.value),
          left: 0,
          right: 0,
          child: child!,
        );
      },
      child: Icon(
        Icons.arrow_upward,
        color: Colors.white,
      ),
    );
  }
}
