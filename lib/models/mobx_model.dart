import 'package:mobx/mobx.dart';

part 'mobx_model.g.dart';

class Counter = CounterStore with _$Counter;

abstract class CounterStore with Store {
  @observable
  int value = 0;
  @action
  void increment() => value++;
  @action
  decrease() => value--;
}
