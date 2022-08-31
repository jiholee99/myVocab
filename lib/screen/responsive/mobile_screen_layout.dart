import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  Future<void> signOutHandler() async {
    try {
      print("Signing out...");
      print(FirebaseAuth.instance.currentUser);
      await FirebaseAuth.instance.signOut();
      print(FirebaseAuth.instance.currentUser);
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mobile")),
      body: Center(
          child: IconButton(
        icon: Icon(Icons.login_outlined),
        onPressed: () async {
          await signOutHandler();
        },
      )),
    );
  }
}
