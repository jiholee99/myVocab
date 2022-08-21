import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthMethods {
  final _auth = FirebaseAuth.instance;

  Future<String?> signUpWithEmailAndPassword(
      {required String email, required String password, required String confirmPassword}) async {
    try {
      if (password != confirmPassword) {
        return "Please make sure both of the password is correct";
      }
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (error) {
      return error.message;
    } catch (error) {
      return "Unknown error occured";
    }
  }
}
