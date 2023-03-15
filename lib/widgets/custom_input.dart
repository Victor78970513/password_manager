import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(hintText: 'Hola'),
      ),
    );
  }
}
