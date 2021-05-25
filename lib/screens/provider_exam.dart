import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widget.dart';

class ProviderExam extends StatefulWidget {
  ProviderExam({
    Key? key,
  }) : super(key: key);

  @override
  _ProviderExamState createState() => _ProviderExamState();
}

double mainSquareSize(BuildContext context) =>
    MediaQuery.of(context).size.height / 2;

class _ProviderExamState extends State<ProviderExam>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  double get maxHeight => mainSquareSize(context);

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0)
      _controller.fling(
        velocity: max(2.0, -flingVelocity),
      );
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: min(-2.0, -flingVelocity));
    else
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta! / maxHeight;
  }

  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider.value(value: _controller),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider Animation Exam'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () =>
                Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ),
        body: GestureDetector(
          onVerticalDragUpdate: _handleDragUpdate,
          onVerticalDragEnd: _handleDragEnd,
          child: Container(
            color: Colors.red,
            child: Stack(
              children: [
                DotWidget(),
                UpIconWidget(),
                DotVertical(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
