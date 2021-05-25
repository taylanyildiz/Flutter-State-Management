import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DotWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        final bottom = 200.0;
        return Positioned(
          bottom: bottom - 10,
          left: 0.0,
          right: 0.0,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 4 * 32.0 * animation.value),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 4 * 32.0 * animation.value),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
