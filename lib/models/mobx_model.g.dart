// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Counter on CounterStore, Store {
  final _$valueAtom = Atom(name: 'CounterStore.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$CounterStoreActionController = ActionController(name: 'CounterStore');

  @override
  void increment() {
    final _$actionInfo = _$CounterStoreActionController.startAction(
        name: 'CounterStore.increment');
    try {
      return super.increment();
    } finally {
      _$CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrease() {
    final _$actionInfo = _$CounterStoreActionController.startAction(
        name: 'CounterStore.decrease');
    try {
      return super.decrease();
    } finally {
      _$CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
