import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:securepassword/model/password.dart';
import 'package:securepassword/providers/input_provider.dart';

class CardPassword extends StatelessWidget {
  final Password password;
  final Function() onPressed;

  const CardPassword(
      {super.key, required this.password, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String unicode = '0x${password.icon}';
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
                Icon(IconData(int.parse(unicode),
                    fontFamily: 'FontAwesomeBrands',
                    fontPackage: 'font_awesome_flutter')),
                const Spacer(),
                IconButton(icon: const Icon(Icons.delete), onPressed: onPressed)
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
              style: TextStyle(color: Colors.grey[700], fontSize: 15),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ));
  }
}
