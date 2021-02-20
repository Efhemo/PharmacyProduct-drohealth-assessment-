import 'package:flutter/material.dart';

enum ViewState { initial, loading, loaded }

class BaseViewModel<T>  extends ChangeNotifier {

  ViewState _state = ViewState.initial;

  ViewState get
  state => _state;
  void setViewState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  T _result;
  T get result => _result;
  void setResult(T result) {
    _result = result;
    notifyListeners();
  }

}