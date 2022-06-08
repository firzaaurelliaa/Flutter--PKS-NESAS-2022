// ignore_for_file: avoid_unnecessary_containers

import 'package:akhir/futsal.dart';
import 'package:akhir/pilihan_atas.dart';

import 'package:flutter/material.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
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
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo-appbar.png'),
          ],
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
                  color: const Color(0xff142D4C),
                  child: const Text(
                    'Ini home admin',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(
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
                            offset: const Offset(0, 7),
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
                          InkWell(
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PilihanAtas(),
                                ),
                              ),
                            },
                            child: const ImageSlider(
                              image: "assets/images/AKL.png",
                            ),
                          ),
                          const ImageSlider(
                            image: "assets/images/TKI.png",
                          ),
                          const ImageSlider(
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
          const SizedBox(height: 30),

          Container(
            child: const Text(
              'Cabang Olahraga',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 45),
          ),

          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Futsal()),
                  ),
                },
                child: const ItemCabangOlahraga(
                  title: "Futsal",
                  icon: "assets/images/futsal1.png",
                ),
              ),
              const ItemCabangOlahraga(
                title: "Basket",
                icon: "assets/images/basket.png",
              ),
              const ItemCabangOlahraga(
                title: "Volly",
                icon: "assets/images/volly.png",
              ),
            ],
          ),
          const SizedBox(height: 30),
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
          const SizedBox(height: 30),

          //PETANDINGAN TERAKHIR CABOR FUTSAL//

          Container(
            child: DecoratedBox(
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Colors.amber),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              child: DropdownSearch<String>(
                items: const [
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
                dropdownSearchDecoration: const InputDecoration(
                  labelText: "Cabang Olahraga",
                  hintText: "Pilih Cabang olahraga",

                  // floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                onChanged: print,
                selectedItem: "Semua",
              ),
            ),
          ),

          const SizedBox(height: 30),

          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 282,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Color(0xfff6f6f6),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Pertandingan Terakhir',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 186,
                            height: 134,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child:
                                          Image.asset('assets/images/OKTP.png'),
                                    ),
                                    const Center(
                                      child: Text(
                                        'VS',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                            'assets/images/TKI.png')),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 75,
                                      height: 19,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xff142D4C),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Futsal',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Color(0xffD7E9F7)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 75,
                                      height: 19,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffD7E9F7),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '2 - 1',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Color(0xff142D4C),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Kamis, 14 Juli 2022',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

      // //BOTOM NAVIGATION//
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   selectedItemColor: const Color(0xff142D4C),
      //   currentIndex: index,
      //   onTap: (value) {
      //     setState(() {
      //       index = value;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.stairs_outlined), label: 'Klasemen'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
      //   ],
      // ),
    );
  }
}

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
          padding: const EdgeInsets.all(8.0),
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffD7E9F7),
          ),
          child: Image.asset(
            icon,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 14),
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
    return SizedBox(
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
