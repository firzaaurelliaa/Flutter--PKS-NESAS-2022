import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => {
            Navigator.pop((context)),
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Edit Profil',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Container(
                height: 130,
                color: Color(0xff142D4C),
              ),
              Positioned(
                bottom: -50,
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/jokowi.webp'),
                          fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Center(
            child: Container(
              child: Text('Ubah Foto Profil'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Nama'),
                  ],
                ),
                TextField(
                  controller: controller,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Deskripsi'),
                  ],
                ),
                TextField(
                  controller: controllers,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 38),
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    primary: Color(0xff142D4C),
                    onPrimary: Colors.white,
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilAdmin(),
                      ),
                    ),
                  },
                  child: Text(
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
