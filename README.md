# flutter_state_management

Provider, Bloc and Mobx. Example 

### Provider Exam

```dart
late AnimationController _controller;
MultiProvider(
  providers: [
    ListenableProvider.value(value: _controller),
  ],
  child: ../
```
if you have 2 animationController you must have a ChangeNotifier class for other AnimationController

```dart
class AnimationControllerHandle extends ChangeNotifier{

  late AnimationController _controller;
  
  AnimationControllerHandle(this._controller){
    _controller.addListener(animationListener);
  }
  
  double get value => _controller.value;
  
  void forward() => _controller.forward();
  
  void reverse() => _controller.reverse();
  
  void animationListener(){
    notifyListeners();
  }
  
  @override
  void dispose(){
    animationListener();
    super.dispose();
  }
  
}
```
```dart
  Consumer<AnimationController,AnimationControllerHandle>(
    builder: (context,animation,notify,child){
      return Positioned(
        child:child!,
      );
    },
    child:Container(),
  );
```
```dart
Consumer<AnimationController>(
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
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
