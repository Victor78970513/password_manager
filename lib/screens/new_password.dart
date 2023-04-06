import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securepassword/model/password.dart';
import 'package:securepassword/providers/input_provider.dart';
import 'package:securepassword/widgets/custom_input.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final titulo = inputProvider.titleController.text;
          final correo = inputProvider.emailController.text;
          final contrasena = inputProvider.password;
          final colorAlpha = inputProvider.color?.alpha ?? 0;
          final colorRed = inputProvider.color?.red ?? 0;
          final colorGreen = inputProvider.color?.green ?? 0;
          final colorBlue = inputProvider.color?.blue ?? 0;
          final newPassword = Password(
              titulo: titulo,
              correo: correo,
              contrasena: contrasena,
              colorAlpha: colorAlpha,
              colorRed: colorRed,
              colorGreen: colorGreen,
              colorBlue: colorBlue);

          await FirebaseFirestore.instance
              .collection('passwords')
              .add(newPassword.aJson());

          Navigator.pushReplacementNamed(context, 'home');
        },
        child: const Icon(Icons.save),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height / 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: inputProvider.color,
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
                      Text(inputProvider.titleController.text,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 30)),
                      Text(inputProvider.emailController.text,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 30))
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
    final inputProvider = Provider.of<InputProvider>(context);
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            Colors.primaries.length,
            (index) => GestureDetector(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.primaries[index]),
              ),
              onTap: () {
                inputProvider.color = Colors.primaries[index].withOpacity(0.4);
              },
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
    final inputProvider = Provider.of<InputProvider>(context);
    return Column(
      children: [
        CustomInput(
          controller: inputProvider.titleController,
          labelText: 'Title Password',
          hintText: 'Title',
        ),
        const SizedBox(height: 10),
        CustomInput(
          controller: inputProvider.emailController,
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
