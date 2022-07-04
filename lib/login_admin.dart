// ignore_for_file: camel_case_types

import 'package:akhir/home_admin.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Login_admin extends StatefulWidget {
  const Login_admin({Key? key}) : super(key: key);

  @override
  State<Login_admin> createState() => _Login_adminState();
}

class _Login_adminState extends State<Login_admin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextEditingController controller = TextEditingController();
  TextEditingController controllers = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => {
            Navigator.pop((context)),
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeAdmin();
          }
          return const OopLogin();
        },
      ),
    );
  }
}

class OopLogin extends StatefulWidget {
  const OopLogin({Key? key}) : super(key: key);

  @override
  State<OopLogin> createState() => _OopLoginState();
}

class _OopLoginState extends State<OopLogin> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextEditingController controller = TextEditingController();
  TextEditingController controllers = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Center(child: Image.asset('assets/images/login.png')),
              const SizedBox(height: 40),
              const Text(
                'Masuk sebagai admin',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff142D4C),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: const Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff142D4C),
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Masukan username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xff142D4C))),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: const Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff142D4C),
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'Masukan password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xff142D4C))),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: const Size(370, 38),
                          textStyle: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                          primary: const Color(0xff142D4C),
                          onPrimary: Colors.white,
                        ),
                        onPressed: signIn,
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
