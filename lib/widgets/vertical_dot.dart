import 'package:flutter/material.dart';
import 'package:flutter_state_management/screens/provider_exam.dart';
import 'package:provider/provider.dart';

class VerticalDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer2<AnimationController, ColorAnimation>(
      builder: (context, animation, color, child) {
        final bottom = size.height / 8;
        final distance = 100 * animation.value;
        if (animation.value <= 0.1) {
          color.stop();
        }
        return Positioned(
          bottom: bottom,
          left: 0.0,
          right: 0.0,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: distance),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: distance),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
