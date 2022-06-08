// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'profil_admin.dart';

class EditProfilAdmin extends StatefulWidget {
  const EditProfilAdmin({Key? key}) : super(key: key);

  @override
  State<EditProfilAdmin> createState() => _EditProfilAdminState();
}

class _EditProfilAdminState extends State<EditProfilAdmin> {
  TextEditingController controller = TextEditingController();
  TextEditingController controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff142D4C),
        elevation: 0,
        title: const Text(
          'Edit Profil',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 130,
                color: const Color(0xff142D4C),
              ),
              Positioned(
                bottom: -50,
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/jokowi.webp'),
                          fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Center(
            child: Container(
              child: const Text('Ubah Foto Profil'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Nama :'),
                  ],
                ),
                TextFormField(
                  controller: controller,
                  maxLength: 25,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(child: const Text('Deskripsi :')),
                  ],
                ),
                TextField(
                  controller: controllers,
                  maxLength: 15,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 38),
                    textStyle: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                    primary: const Color(0xff142D4C),
                    onPrimary: Colors.white,
                  ),
                  onPressed: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilAdmin(),
                      ),
                    ),
                  },
                  child: const Text(
                    'Simpan',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
