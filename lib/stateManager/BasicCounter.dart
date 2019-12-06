import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class BasicCounter with ChangeNotifier {
  int _counter;

  BasicCounter(this._counter);

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}