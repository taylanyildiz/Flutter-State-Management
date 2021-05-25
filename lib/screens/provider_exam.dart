import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widget.dart';

class AnimationControllerHandle with ChangeNotifier {
  late AnimationController _controller;

  AnimationControllerHandle(this._controller) {
    _controller.addListener(_animationListen);
  }

  void _animationListen() {
    notifyListeners();
  }

  @override
  void dispose() {
    _animationListen();
    super.dispose();
  }

  double get value => _controller.value;

  void forward() => _controller.forward();

  void reverse() => _controller.reverse();

  AnimationStatus get status => _controller.status;
}

class ColorAnimation with ChangeNotifier {
  late AnimationController _controller;

  ColorAnimation(this._controller) {
    _controller.addListener(_animationListen);
  }

  void _animationListen() {
    notifyListeners();
  }

  @override
  void dispose() {
    _animationListen();
    super.dispose();
  }

  double get value => _controller.value;

  void forward() => _controller.forward();

  void repeat() => _controller.repeat();

  void stop() => _controller.stop();

  Color? get color => ColorTween(begin: Colors.blue, end: Colors.red)
      .animate(_controller)
      .value;

  AnimationStatus get status => _controller.status;
}

class ProviderExam extends StatefulWidget {
  @override
  _ProviderExamState createState() => _ProviderExamState();
}

class _ProviderExamState extends State<ProviderExam>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _controllerUpIcon;
  late AnimationController _controllerColor;
  late AnimationController _controllerDrag;
  late AnimationController _controllerClick;
  late Animation<double> _dragAnimation;
  late Animation<double> _clickAnimation;

  @override
  void deactivate() {
    super.deactivate();
    _animationController.dispose();
    _controllerUpIcon.dispose();
    _controllerColor.dispose();
    _controllerClick.dispose();
    _controllerDrag.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _controllerColor = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controllerUpIcon = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controllerDrag = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controllerClick = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _clickAnimation =
        Tween<double>(begin: 0.5, end: 1.2).animate(_controllerClick);
    _dragAnimation =
        Tween<double>(begin: 0.5, end: 1.2).animate(_controllerDrag);
  }

  void _verticalUpdateHandle(DragUpdateDetails detail, Size size) {
    _animationController.value -= detail.primaryDelta! / size.height;
  }

  void _verticalEndHandle(DragEndDetails detail, Size size) {
    if (_animationController.isAnimating || _animationController.isCompleted)
      return;
    final _velocity = detail.velocity.pixelsPerSecond.dy / size.height;
    if (_velocity < 0.0)
      _animationController.fling(
        velocity: max(2.0, -_velocity),
      );
    else {
      _animationController.fling(
        velocity: max(-2.0, -_velocity),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Provider Exam'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
        ),
      ),
      body: MultiProvider(
        providers: [
          ListenableProvider.value(value: _animationController),
          ListenableProvider.value(
              value: AnimationControllerHandle(_controllerUpIcon)),
          ListenableProvider.value(value: ColorAnimation(_controllerColor)),
        ],
        child: GestureDetector(
          onVerticalDragUpdate: (detail) => _verticalUpdateHandle(detail, size),
          onVerticalDragEnd: (detail) => _verticalEndHandle(detail, size),
          child: Container(
            color: Colors.grey,
            child: Stack(
              children: [
                Consumer<AnimationController>(
                  builder: (context, animation, child) {
                    if (animation.status != AnimationStatus.completed) {
                      _controllerDrag.repeat();
                    } else {
                      _controllerDrag.stop();
                    }
                    return AnimatedBuilder(
                      animation: _dragAnimation,
                      builder: (context, child) => Positioned(
                        bottom: 300.0,
                        left: 0.0,
                        right: 0.0,
                        child: Center(
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..scale(_controllerDrag.isAnimating
                                  ? _dragAnimation.value
                                  : 0.0),
                            child: Text(
                              'Drag Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Consumer2<AnimationController, AnimationControllerHandle>(
                    builder: (context, animation, notify, child) {
                  if (animation.status == AnimationStatus.completed) {
                    _controllerClick.repeat();
                  }
                  if (notify.value > 0) {
                    _controllerClick.stop();
                  }

                  return AnimatedBuilder(
                      animation: _controllerClick,
                      builder: (context, child) {
                        return Positioned(
                          bottom: 300.0,
                          left: 0.0,
                          right: 0.0,
                          child: Center(
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..scale(_controllerClick.isAnimating
                                    ? _clickAnimation.value
                                    : 0.0),
                              child: Text(
                                'Click Icon arrow up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }),
                MapImage(),
                VerticalDot(),
                VerticalUpIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
