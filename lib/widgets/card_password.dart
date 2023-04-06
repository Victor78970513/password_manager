import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securepassword/model/password.dart';
import 'package:securepassword/providers/input_provider.dart';

class CardPassword extends StatelessWidget {
  final Password password;

  const CardPassword({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(password.colorAlpha, password.colorRed,
              password.colorGreen, password.colorBlue),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.facebook),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                )
              ],
            ),
            const Spacer(),
            Text(
              password.titulo,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              password.correo,
              style: TextStyle(color: Colors.grey[400], fontSize: 15),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ));
  }
}
