import 'package:flutter/material.dart';

class InputProvider extends ChangeNotifier {
  TextEditingController _controller = TextEditingController();

  String get controller => _controller.text;
  set controller(String valor) {
    _controller.text = valor;
  }
}
