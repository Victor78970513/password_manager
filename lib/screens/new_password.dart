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
                ),
                CustomInput(),
                CustomInput(),
                CustomInput(),
                CustomInput(),
                CustomInput(),
                CustomInput(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
