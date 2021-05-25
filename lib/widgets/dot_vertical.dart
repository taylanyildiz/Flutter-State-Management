import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DotVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        return Positioned(
          bottom: 200.0,
          top: size.height /
                  (4 * ((animation.value > 0.5) ? animation.value : 0)) +
              170,
          left: 0.0,
          right: 0.0,
          child: child!,
        );
      },
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 8.0,
              height: double.infinity,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
