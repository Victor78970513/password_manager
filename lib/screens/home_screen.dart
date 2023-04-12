import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:securepassword/model/password.dart';
import 'package:securepassword/screens/new_password.dart';
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
                  .orderBy('fecha', descending: true)
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
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height),
                      child: GridView.count(
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          children:
                              List.generate(passwords.length + 1, (index) {
                            if (index < passwords.length) {
                              final password = passwords[index];
                              return CardPassword(
                                password: password,
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('passwords')
                                      .doc(documentSnaphots[index].id)
                                      .delete();
                                },
                              );
                            } else {
                              return const AddPassword();
                            }
                          })),
                    ),
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

class AddPassword extends StatelessWidget {
  const AddPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const NewPassword())),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFD9D9E3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff007AFF)),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            const Spacer(),
            const Text(
              "create",
              style: TextStyle(
                  color: Color(0xff007AFF),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
