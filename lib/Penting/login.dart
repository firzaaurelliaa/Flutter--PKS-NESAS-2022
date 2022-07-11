// ignore_for_file: unrelated_type_equality_checks, avoid_print, avoid_unnecessary_containers
import 'package:akhir/Admin/NavBar%20Admin/navbar_admin.dart';
import 'package:akhir/Penting/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))),
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
              const SizedBox(height: 20),
              SafeArea(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            labelText: "Email :",
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Color(0xff142D4C))),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          obscureText: _isHidePassword,
                          autofocus: false,
                          controller: passwordController,
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            labelText: "Password :",
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xff142D4C),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _togglePasswordVisibility();
                              },
                              child: Icon(
                                _isHidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: _isHidePassword
                                    ? Colors.grey
                                    : const Color(0xff142D4C),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        loading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xff142D4C)))
                            : SizedBox(
                                height: 38,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: const Color(0xff142D4C),
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    if (emailController.text == "" ||
                                        passwordController == "") {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "Inputan tidak boleh kosong"),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else {
                                      User? result = await AuthService()
                                          .register(emailController.text,
                                              passwordController.text, context);
                                      if (result != null) {
                                        print(
                                            "Telah berhasil login ke halaman admin");
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const NavBarAdmin()),
                                            (route) => false);
                                      }
                                    }
                                    setState(() {
                                      loading = false;
                                    });
                                  },
                                  child: const Text(
                                    "Masuk",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
