import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signupUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        await _firestore.collection("Users").doc(cred.user!.uid).set({
          'Username': username,
          'Uid': cred.user!.uid,
          'Email': email,
          'Bio': bio,
          'Followers': [],
          'Following': [],
          'PhotoUrl': photoUrl
        });
        res = "Success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = "Email is badly formatted";
      } else if (err.code == 'weak-password') {
        res = "Password should be atleast 6 characters";
      } else if (err.code == 'email-already-in-use') {
        res = "The account already exists for that email";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
