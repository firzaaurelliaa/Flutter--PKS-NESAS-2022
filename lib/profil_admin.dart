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
        leading: IconButton(
          onPressed: () => {
            Navigator.pop((context)),
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilAdmin(),
                ),
              ),
            },
            icon: Icon(
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
                decoration: BoxDecoration(
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/jokowi.webp'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  ListTile(
                    title: Center(child: Text('Firza Aurellia Iskandar')),
                    subtitle: Center(child: Text('- SMKN 1 SUBANG -')),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 300),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 38),
                  textStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  primary: Color(0xff142D4C),
                  onPrimary: Colors.white,
                ),
                onPressed: () {},
                child: Text(
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
      //BOTOM NAVIGATION//
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff142D4C),
        // currentIndex: index,
        onTap: (value) {
          // setState(() {
          //   index = value;
          // });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stairs_outlined), label: 'Klasemen'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}
