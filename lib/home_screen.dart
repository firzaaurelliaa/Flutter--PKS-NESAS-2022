import 'dart:ui';

import 'package:flutter/material.dart';
import 'profil_admin.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (ProfilAdmin()),
                ),
              ),
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Color(0xff142D4C),
        elevation: 0,
        title: Container(
          child: Row(
            children: [
              Image.asset('assets/images/logo-appbar.png'),
            ],
          ),
        ),
      ),
      body: ListView(
        // padding: EdgeInsets.symmetric(horizontal: 25),
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: ClipPathClass(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: Color(0xff142D4C),
                  child: Text(
                    'Salam Olahraga!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: 324,
                      height: 147,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 1.5,
                            offset: Offset(0, 7),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          // autoPlay: true,
                          // aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                        items: [
                          ImageSlider(
                            image: "assets/images/OKTP.png",
                          ),
                          ImageSlider(
                            image: "assets/images/TKI.png",
                          ),
                          ImageSlider(
                            image: "assets/images/OKTP.png",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),

          Container(
            child: Text(
              'Cabang Olahraga',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 45),
          ),

          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ItemCabangOlahraga(
                title: "Futsal",
                icon: "assets/images/futsal1.png",
              ),
              ItemCabangOlahraga(
                title: "Basket",
                icon: "assets/images/basket.png",
              ),
              ItemCabangOlahraga(
                title: "Volly",
                icon: "assets/images/volly.png",
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ItemCabangOlahraga(
                title: "Catur",
                icon: "assets/images/catur.png",
              ),
              ItemCabangOlahraga(
                title: "Bulutangkis",
                icon: "assets/images/bulutangkis.png",
              ),
              ItemCabangOlahraga(
                title: "Tenis Meja",
                icon: "assets/images/tenis.png",
              ),
            ],
          ),
          SizedBox(height: 30),

          //PETANDINGAN TERAKHIR CABOR FUTSAL//

          Container(
            child: const Text(
              'Pertandingan Terakhir',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 45),
          ),
          Container(
            child: DropdownSearch<String>(
              items: [
                "Semua",
                "Futsal",
                "Basket",
                "Voli",
                'Catur',
                "Bulutangkis",
                "Tenis Meja",
              ],
              mode: Mode.MENU,
              showSelectedItem: true,
              dropdownSearchDecoration: InputDecoration(
                labelText: "Cabang Olahraga",
                hintText: "Pilih Cabang olahraga",

                // floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              onChanged: print,
              selectedItem: "Semua",
            ),
            margin: EdgeInsets.only(left: 270),
          ),

          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       PertandinganTerakhir(
          //           title: "RPL", icon: "assets/images/OKTP.png"),
          //     ],
          //   ),
          // ),

          SizedBox(height: 30),

          Stack(
            children: [
              Container(
                width: 167,
                height: 127,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8)),
              ),
              Container(
                width: 49,
                height: 49,
                color: Colors.white,
                child: Image.asset('assets/images/OKTP.png'),
                margin: EdgeInsets.all(20),
              ),
              Container(
                width: 49,
                height: 49,
                color: Colors.white,
                child: Image.asset('assets/images/OKTP.png'),
                margin: EdgeInsets.only(left: 90),
              ),
              Container(
                width: 75,
                height: 19,
                margin: EdgeInsets.only(top: 75, left: 70),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffD7E9F7),
                ),
                child: Center(
                  child: Text(
                    '2-1',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff142D4C),
                    ),
                  ),
                ),
              ),
              Container(
                width: 75,
                height: 19,
                margin: EdgeInsets.only(top: 75, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xff142D4C),
                ),
                child: Center(
                  child: Text(
                    'Futsal',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Kamis, 14 Juli 2022',
                  style: TextStyle(fontSize: 10),
                ),
                padding: EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              ),
            ],
          ),
        ],
      ),

      //BOTOM NAVIGATION//
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff142D4C),
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stairs_outlined), label: 'Klasemen'),
        ],
      ),
    );
  }
}

// class LastMatch extends StatelessWidget {
//   const LastMatch({
//     Key? key,
//     required this.title,
//     required this.icon,
//   }) : super(key: key);

//   final String title;
//   final String icon;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           padding: EdgeInsets.only(bottom: 10),
//           width: 80,
//           height: 80,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 spreadRadius: 0,
//                 blurRadius: 1.5,
//                 offset: Offset(0, 7),
//               ),
//             ],
//           ),
//           child: Image.asset(
//             icon,
//             fit: BoxFit.cover,
//           ),
//         ),
//         SizedBox(height: 5),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
// }

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ItemCabangOlahraga extends StatelessWidget {
  const ItemCabangOlahraga({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffD7E9F7),
          ),
          child: Image.asset(
            icon,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 67,
      height: 67,
      child: Image.asset(
        image,
      ),
    );
  }
}

class PertandinganTerakhir extends StatelessWidget {
  const PertandinganTerakhir({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176,
      height: 124,
      color: Colors.amber,
      child: Image.asset(icon),
    );
  }
}
