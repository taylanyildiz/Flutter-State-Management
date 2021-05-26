import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc() : super(0);

  void increment() {
    int counter = state + 1;
    emit(counter);
  }

  void decrease() {
    int counter = state - 1;
    emit(counter);
  }
}
