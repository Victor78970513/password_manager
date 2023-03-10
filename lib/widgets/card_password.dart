import 'package:flutter/material.dart';
import 'package:securepassword/model/password.dart';

class CardPassword extends StatelessWidget {
  final Password password;

  const CardPassword({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff516BBF),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.facebook),
                Spacer(),
                Icon(Icons.delete)
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
