import 'package:flutter/material.dart';
import 'package:securepassword/widgets/custom_input.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height / 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.facebook, size: 50),
                          Spacer(),
                          Icon(Icons.delete, size: 50)
                        ],
                      ),
                      const Spacer(),
                      const Text('Titulo',
                          style: TextStyle(color: Colors.red, fontSize: 30)),
                      const Text('Correo',
                          style: TextStyle(color: Colors.red, fontSize: 30))
                    ],
                  ),
                ),
                _PasswordInputs(),
                _PasswordColor()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            Colors.primaries.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.primaries[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomInput(
          labelText: 'Title Password',
          hintText: 'Title',
        ),
        SizedBox(height: 10),
        CustomInput(
          labelText: 'Email Adress',
          hintText: 'Email',
        ),
        SizedBox(height: 10),
        CustomInput(
          labelText: 'Password',
          hintText: 'password',
        ),
        SizedBox(height: 10),
        CustomInput(
          labelText: 'Name',
          hintText: 'User name',
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
