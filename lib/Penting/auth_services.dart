// ignore_for_file: avoid_print, body_might_complete_normally_nullable

import 'package:akhir/Admin/NavBar%20Admin/navbar_admin.dart';
import 'package:akhir/User/Navbar%20User/navbar_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Register User
  Future<User?> register(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  }

  // Login

  Future<User?> login(
      String email, String password, BuildContext context) async {
    try {} on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  // Future<User?> login(
  //     String email, String password, BuildContext context) async {
  //   try {
  //     UserCredential userCredential =
  //         await firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text(e.message.toString()),
  //       backgroundColor: Colors.red,
  //     ));
  //   } catch (e) {
  //     print(e);
  //   }
  //   UserCredential userCredential = await firebaseAuth
  //       .signInWithEmailAndPassword(email: email, password: password);
  //   return userCredential.user;
  // }

  Future<void> signOut(BuildContext context) async {
    if (firebaseAuth.currentUser == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NavBarUser()));
      return;
    }
    await firebaseAuth.signOut().then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const NavBarAdmin()));
    });
  }
}
