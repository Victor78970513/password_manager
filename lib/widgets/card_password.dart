import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:securepassword/model/password.dart';

class CardPassword extends StatelessWidget {
  final Password password;
  final Function() onPressed;

  const CardPassword(
      {super.key, required this.password, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String unicode = '0x${password.icon}';
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return _alerta();
            });
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(password.colorAlpha, password.colorRed,
                password.colorGreen, password.colorBlue),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                  IconButton(
                      icon: const Icon(Icons.delete), onPressed: onPressed)
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
              const SizedBox(height: 7),
              Text(
                password.correo,
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )),
    );
  }

  Widget _alerta() {
    return CupertinoAlertDialog(
      title: const Text('Contenido'),
      // backgroundColor: Colors.white,
      content: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              Text(password.correo),
              const Spacer(),
              IconButton(
                  onPressed: () async {
                    await FlutterClipboard.copy(password.correo);
                  },
                  icon: const Icon(Icons.copy_outlined)),
            ]),
            Row(children: [
              Text(password.contrasena),
              const Spacer(),
              IconButton(
                  onPressed: () async {
                    await FlutterClipboard.copy(password.contrasena);
                  },
                  icon: const Icon(Icons.copy_outlined)),
            ]),
          ],
        ),
      ),
      actions: [Text('OK')],
    );
  }
}
