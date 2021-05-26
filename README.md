# flutter_state_management

Provider, Bloc and MobX. Example


|              App Display             | 
| :----------------------------------: | 
| <a  target="_blank"><img src="https://user-images.githubusercontent.com/37551474/119607169-7f4b9480-bdfc-11eb-963f-b06ecc0968f3.gif" width:'200'></a> | 

## Pubspec.yaml
 - [yaml](https://github.com/taylanyildiz/Flutter-State-Management/blob/master/pubspec.yaml)
```yaml
 # provider package
 provider:
 # bloc package
 flutter_bloc:
 # mobx package
 mobx:
 flutter_mobx:
 build_runner:
```

## Provider Exam
 - How create ChangeNotifier class 
```dart
 class AnimationHandler with ChangeNotifier{
     late AnimationController _controller;

     late double _value;
    
     AnimationHandler(this._controller){
         _controller.addListener(animationListener);
     }
     
     void animationListener(){
         notifyListeners();
     }
     
     @override
     void dispose(){
         animationListener();
         super.dispose();
     }

     double get value => _value;

     void forward() => _controller.forward();

     void reverse() => _controller.reverse();
 }
```
- First of all, it must be introduced to the application.

```dart
late AnimationController _controller;
 MultiProvider(
     providers:[
         ListenableProvider.value(value: AnimationHandler(_controller)),
     ],
    child:HomeScreen(),
 )
```
- How to call Provider class. [Consumer]

```dart
    Consumer<AnimationHandler>(
        builder:(context,animation,child) => child!,
        child:Container(),
    )
```

- if you have 2 animation for provider.

```dart
/// AnimationController already have [ChangeNotifier].
late AnimationController _controllerOther;
late AnimationController _controller;
 MultiProvider(
     providers:[
         ListenableProvider.value(value: _controllerOther),
         ListenableProvider.value(value: AnimationHandler(_controller)),
     ],
     child: HomeScreen(),
 )
```
- How to call

```dart
 Consumer2<AnimationController,AnimationHandler>(
     builder(context,animation,notify,child) => child!,
     child:Container(),
 ),
```

## Bloc Exam

- Bloc management work like Provider,already have provider.
- How create Bloc class.



```dart
 /// [emit] to listen to the value to be renturned.
 /// [super(value)] initial value of the variable 
 /// [state] holds variable value
 class CounterBloc extends Cubit<int>{
    CounterBloc():super(0);

    void increment(){
        int counter = state + 1;
        emit(counter);
    }

    void decrease(){
        int counter = state -1;
        emit(counter);
    }

 }
```

- First of all, it must be introduced to the application.

```dart
    MultiBlocProvider(
        providers:[
            BlocProvider(create:(_) => CounterBloc()),
        ],
        child:HomeScreen(),
    ),
```

- How to call [Bloc] class.

```dart
    /// [BlocBuilder<class,value>] 
    /// [class] => bloc class.
    /// [value] => return value.
    BlocBuilder<CounterBloc,value>(
        builder:(context,value) => Text('${value}'),
    ),
    MaterialButton(
        onPressed:() => context.read<CounterBloc>().increment(),
    ),
    MaterialButton(
        onPressed:() => context.read<CounterBloc>().decrease(),
    ),
```

## MobX Exam

- It cannot be called from every page. It only works in the class it is called from.

- How to create [MobX] class

```dart
    /// [Cubit] <---> value to return.
    /// [actions] to make an event happen.
    /// [observable] to listen value.
    /// [computed]  to indicate a condition.

    /// this class name must be same your mobx class path name.
    /// and you have write this code => ['flutter packages pub run build_runner watch'] in [CMD].

    part 'counter_model.g.dart';
    
    class Counter = CounterStore with _$Counter;

    abstract class CounterStore with Store{

        @observable
        int value = 0;

        @actions
        void increment()=>value++;

        @actions
        void decrease() => value--;

        @computed
        value > 10 ? value=0:value;
    }
```

- How to call [MobX] class

```dart
    final counter = Counter();
    Observer(
        build:(_) => Text('${counter.value}'),
    ),
    MaterialButton(
        onPressed:()=> counter.increment(),
    )
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
