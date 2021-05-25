import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/screens/provider_exam.dart';
import 'package:provider/provider.dart';

class VerticalUpIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer3<AnimationController, AnimationControllerHandle,
        ColorAnimation>(
      builder: (context, animation, notify, color, child) {
        final bottom =
            (size.height / 8 - 15.0) + (size.height / 2) * notify.value;
        color.repeat();
        if (notify.status == AnimationStatus.completed) {
          color.stop();
        }
        return Positioned(
          bottom: bottom,
          left: 0.0,
          right: 0.0,
          child: Opacity(
            opacity: animation.value,
            child: Center(
              child: Stack(
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(1.0),
                    child: Container(
                      padding: EdgeInsets.all(28.0),
                      decoration: BoxDecoration(
                        color: color.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Transform.rotate(
                      angle: pi * notify.value,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.arrow_upward),
                            color: Colors.red,
                            onPressed: () {
                              if (notify.status == AnimationStatus.completed) {
                                notify.reverse();
                              } else {
                                notify.forward();
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
