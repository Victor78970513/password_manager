import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:securepassword/model/password.dart';
import 'package:securepassword/widgets/card_password.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Passwords',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('passwords')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final querySnaphot = snapshot.data!;
                  final documentSnaphots = querySnaphot.docs;
                  List<Password> passwords = [];
                  for (var document in documentSnaphots) {
                    final password = Password.fromDocumentSnapshot(document);
                    passwords.add(password);
                  }
                  return Center(
                    child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(passwords.length, (index) {
                          final password = passwords[index];
                          return CardPassword(password: password);
                        })),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ));
  }
}
