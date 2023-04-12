import 'package:cloud_firestore/cloud_firestore.dart';

class Password {
  final String titulo;
  final String correo;
  final String contrasena;
  final int colorAlpha;
  final int colorRed;
  final int colorGreen;
  final int colorBlue;
  final String date;
  final String icon;

  Password({
    required this.titulo,
    required this.correo,
    required this.contrasena,
    required this.colorAlpha,
    required this.colorRed,
    required this.colorGreen,
    required this.colorBlue,
    required this.date,
    required this.icon,
  });

  factory Password.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    final json = documentSnapshot.data() as Map<String, dynamic>;
    return Password(
      titulo: json['titulo'],
      correo: json['correo'],
      contrasena: json['contrasena'],
      colorAlpha: json['colorAlpha'],
      colorRed: json['colorRed'],
      colorGreen: json['colorGreen'],
      colorBlue: json['colorBlue'],
      date: json['fecha'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> aJson() {
    return {
      'titulo': titulo,
      'correo': correo,
      'contrasena': contrasena,
      'colorAlpha': colorAlpha,
      'colorRed': colorRed,
      'colorGreen': colorGreen,
      'colorBlue': colorBlue,
      'fecha': date,
      'icon': icon,
    };
  }
}
