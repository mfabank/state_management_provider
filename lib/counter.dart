import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int _counter;
  Counter(this._counter);

  int get counter => _counter;

  void arttir() {
    _counter++;
    notifyListeners();
  }

  void azalt() {
    _counter--;
    notifyListeners();
  }
}
