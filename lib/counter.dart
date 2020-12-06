import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier{
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