import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/screens/provider_exam.dart';
import 'package:provider/provider.dart';

class MapImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationControllerHandle>(
        builder: (context, animation, child) {
          final scale = 1 + 0.3 * (1 - animation.value);
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..scale(scale, scale)
              ..rotateZ(.05 * pi * (1 - animation.value)),
            child: Opacity(
              opacity: animation.value,
              child: child!,
            ),
          );
        },
        child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'images/map.png',
              fit: BoxFit.cover,
            )));
  }
}
