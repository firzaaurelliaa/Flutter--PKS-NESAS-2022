// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'edit_profil_admin.dart';

class ProfilAdmin extends StatefulWidget {
  const ProfilAdmin({Key? key}) : super(key: key);

  @override
  State<ProfilAdmin> createState() => _ProfilAdminState();
}

class _ProfilAdminState extends State<ProfilAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfilAdmin(),
                ),
              ),
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 280,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 135,
                    height: 135,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/jokowi.webp'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const ListTile(
                    title: Center(child: Text('Firza Aurellia Iskandar')),
                    subtitle: Center(child: Text('- SMKN 1 SUBANG -')),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 300),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 38),
                  textStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                  primary: const Color(0xff142D4C),
                  onPrimary: Colors.white,
                ),
                onPressed: () {},
                child: const Text(
                  'Keluar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
