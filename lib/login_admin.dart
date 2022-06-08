// ignore_for_file: camel_case_types

import 'package:akhir/home_admin.dart';

import 'package:flutter/material.dart';

class Login_admin extends StatefulWidget {
  const Login_admin({Key? key}) : super(key: key);

  @override
  State<Login_admin> createState() => _Login_adminState();
}

class _Login_adminState extends State<Login_admin> {
  TextEditingController controller = TextEditingController();
  TextEditingController controllers = TextEditingController();
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
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
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
              Container(
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
                      controller: controller,
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
                      controller: controllers,
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
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(370, 38),
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                        primary: const Color(0xff142D4C),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeAdmin(),
                          ),
                        ),
                      },
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
            ],
          ),
        ],
      ),
    );
  }
}
