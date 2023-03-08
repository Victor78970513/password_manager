import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool authenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('hola'),
      ),
    );
  }
}
