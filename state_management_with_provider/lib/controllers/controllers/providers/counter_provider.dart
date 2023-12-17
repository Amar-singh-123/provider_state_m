

import 'package:flutter/cupertino.dart';

class CountProvider extends ChangeNotifier{

  int _num = 0;

 int get num => _num;

  void increaseNum(){
    _num = num + 1;
    notifyListeners();

  }




}