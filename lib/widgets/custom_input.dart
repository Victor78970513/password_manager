import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;

  const CustomInput(
      {super.key,
      this.hintText,
      this.labelText,
      this.helperText,
      this.icon,
      this.suffixIcon});
  @override
  Widget build(BuildContext context) {
    // final inputProvider =
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon == null ? null : Icon(icon),
          icon: icon == null ? null : Icon(icon),
        ),
      ),
    );
  }
}
