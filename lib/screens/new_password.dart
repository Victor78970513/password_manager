import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:securepassword/model/password.dart';
import 'package:securepassword/providers/input_provider.dart';
import 'package:securepassword/widgets/custom_input.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);
    DateTime now = DateTime.now();
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
          final date = now.toString();
          final icon = inputProvider.icon.toString().substring(12, 16);
          final newPassword = Password(
              titulo: titulo,
              correo: correo,
              contrasena: contrasena,
              colorAlpha: colorAlpha,
              colorRed: colorRed,
              colorGreen: colorGreen,
              colorBlue: colorBlue,
              date: date,
              icon: icon);

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
                        children: [
                          Icon(
                            // Icons.question_mark_outlined,
                            inputProvider.icon,
                            size: 50,
                          ),
                          const Spacer(),
                          const Icon(Icons.delete, size: 50)
                        ],
                      ),
                      const Spacer(),
                      Text(inputProvider.titleController.text,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30)),
                      Text(inputProvider.emailController.text,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30))
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
    List<IconData> fontawesomeIcons = [
      FontAwesomeIcons.facebook,
      FontAwesomeIcons.whatsapp,
      FontAwesomeIcons.twitter,
      FontAwesomeIcons.instagram,
      FontAwesomeIcons.youtube,
      FontAwesomeIcons.google,
      FontAwesomeIcons.apple,
      FontAwesomeIcons.github,
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.paypal,
      FontAwesomeIcons.spotify,
      FontAwesomeIcons.twitch,
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                Colors.primaries.length,
                (index) => GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.primaries[index]),
                  ),
                  onTap: () {
                    inputProvider.color =
                        Colors.primaries[index].withOpacity(0.4);
                  },
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                fontawesomeIcons.length,
                (index) => GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      fontawesomeIcons[index],
                      size: 40,
                      color: Colors.grey[400],
                    ),
                  ),
                  onTap: () {
                    inputProvider.icon = fontawesomeIcons[index];
                    final long = inputProvider.icon.toString().length;
                    print(
                        inputProvider.icon.toString().substring(12, long - 1));
                  },
                ),
              ),
            ),
          )
        ],
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
        const SizedBox(height: 10),
        CustomInput(
          controller: inputProvider.passwordController,
          labelText: 'Password',
          hintText: 'password',
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
