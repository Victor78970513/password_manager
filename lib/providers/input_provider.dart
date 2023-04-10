import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputProvider extends ChangeNotifier {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Color? _color = Colors.grey[300];
  IconData? _icon = FontAwesomeIcons.peopleGroup;
  String _password = '';

  IconData? get icon => _icon;
  set icon(IconData? newIcon) {
    _icon = newIcon;
    notifyListeners();
  }

  TextEditingController get titleController => _titleController;
  set titleController(TextEditingController text) {
    _titleController = text;
    notifyListeners();
  }

  TextEditingController get emailController => _emailController;
  set emailController(TextEditingController text) {
    _emailController = text;
    notifyListeners();
  }

  TextEditingController get passwordController => _passwordController;
  set passwordController(TextEditingController text) {
    _passwordController = text;
    notifyListeners();
  }

  Color? get color => _color;
  set color(Color? newColor) {
    _color = newColor;
    notifyListeners();
  }

  String get password => _password;
  set password(String text) {
    _password = text;
  }
}
