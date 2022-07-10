// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors

import 'package:akhir/Admin/FUTSAL/futsal.dart';
import 'package:akhir/Admin/Profil%20Jurusan/tabbar_profil_jurusan.dart';
import 'package:akhir/Admin/edit_pertandingan_terakhir.dart';
import 'package:akhir/page_belum_diatur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:akhir/OOP_Custom_Widgets.dart/image_slider_home.dart';
import 'package:flutter/material.dart';
import 'package:akhir/OOP_Custom_Widgets.dart/item_cabor_home.dart';
// import 'package:intl/intl.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  final CarouselController _controller = CarouselController();

  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
      ),
      body: ListView(
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
                    'Salam Olahraga, min!',
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
                      height: 80,
                    ),
                    Container(
                      width: 324,
                      height: 170,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 1.7,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 18),
                          const Text(
                            'Mana nih tim jagoanmu?',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff142D4C),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 2),
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('jurusanDatas')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const CircularProgressIndicator(
                                    color: Color(0xff142D4C),
                                  );
                                }

                                return FlutterCarousel.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (_, index, __) {
                                    return InkWell(
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TabbarProfilJurusan(
                                                    docData: snapshot
                                                        .data!.docs[index]),
                                          ),
                                        ),
                                      },
                                      child: ImageSlider(
                                        image: snapshot.data!.docs[index]
                                            .get('logoJurusan'),
                                      ),
                                    );
                                  },
                                  options: CarouselOptions(
                                    viewportFraction: 0.3,
                                    aspectRatio: 1.5 / 0.4,
                                    autoPlay: false,
                                    floatingIndicator: true,
                                    enlargeCenterPage: true,
                                    initialPage: 1,
                                    // slideIndicator: CircularWaveSlideIndicator(),
                                    showIndicator: false,
                                  ),
                                  carouselController: _controller,
                                );
                              }),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 35,
                                  height: 25,
                                  child: Flexible(
                                    child: IconButton(
                                      onPressed: _controller.previousPage,
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Color(0xff142D4C),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 35,
                                  height: 25,
                                  child: Flexible(
                                    child: IconButton(
                                      onPressed: _controller.nextPage,
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xff142D4C),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
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
              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PageBelumDiatur()),
                  ),
                },
                child: const ItemCabangOlahraga(
                  title: "Basket",
                  icon: "assets/images/basket.png",
                ),
              ),
              const ItemCabangOlahraga(
                title: "Voli",
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

          //Pertandingan Terakhir

          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('pertandinganTerakhir')
                  // .orderBy('tanggalPertandingan', descending: true)
                  // .limit(1)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return (Container());
                }
                return Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text(
                                    'Pertandingan Terakhir',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditPertandinganTerakhir(
                                          id: 'id',
                                          cabangolahraga: 'futsal',
                                          imageUrl: '',
                                          docid: snapshot.data!.docs[0],
                                          data: snapshot.data!.docs[0]
                                              .get('futsal'),
                                        ),
                                      ),
                                    ),
                                  },
                                  child: Container(
                                    width: 186,
                                    height: 134,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('futsal')['tim1'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
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
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('futsal')['tim2'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
                                            ),
                                            // Text(
                                            //         snapshot.data!.docs[0]
                                            //                 .get('futsal')[
                                            //             'tim1'],
                                            //         style: const TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold,
                                            //           fontSize: 12,
                                            //           color:
                                            //               Color(0xff142D4C),
                                            //         ),
                                            //       ),
                                          ],
                                        ),
                                        const SizedBox(height: 25),
                                        Stack(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xff142D4C),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Futsal',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xffD7E9F7)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xffD7E9F7),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      Text(
                                                        snapshot.data!.docs[0]
                                                                .get('futsal')[
                                                            'skor1'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      const Text(
                                                        '-',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        snapshot.data!.docs[0]
                                                                .get('futsal')[
                                                            'skor2'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        // Text(
                                        //   DateFormat('EEEE, dd MMMM yyyy', 'id')
                                        //       .format((snapshot.data!.docs[0].get(
                                        //                   'tanggalPertandingan')
                                        //               as Timestamp)
                                        //           .toDate()),
                                        //   // snapshot.data!.docs[0]
                                        //   //     .get('tanggalPertandingan')
                                        //   //     .toString(),
                                        //   style: const TextStyle(fontSize: 12),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditPertandinganTerakhir(
                                          id: 'id',
                                          cabangolahraga: 'basket',
                                          imageUrl: '',
                                          docid: snapshot.data!.docs[0],
                                          data: snapshot.data!.docs[0]
                                              .get('basket'),
                                        ),
                                      ),
                                    ),
                                  },
                                  child: Container(
                                    width: 186,
                                    height: 134,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('basket')['tim1'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
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
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('basket')['tim2'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
                                            ),
                                            // Text(
                                            //         snapshot.data!.docs[0]
                                            //                 .get('futsal')[
                                            //             'tim1'],
                                            //         style: const TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold,
                                            //           fontSize: 12,
                                            //           color:
                                            //               Color(0xff142D4C),
                                            //         ),
                                            //       ),
                                          ],
                                        ),
                                        const SizedBox(height: 25),
                                        Stack(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xff142D4C),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Basket',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xffD7E9F7)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xffD7E9F7),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      Text(
                                                        snapshot.data!.docs[0]
                                                                .get('basket')[
                                                            'skor1'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      const Text(
                                                        '-',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        snapshot.data!.docs[0]
                                                                .get('basket')[
                                                            'skor2'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        // Text(
                                        //   DateFormat('EEEE, dd MMMM yyyy', 'id')
                                        //       .format((snapshot.data!.docs[0].get(
                                        //                   'tanggalPertandingan')
                                        //               as Timestamp)
                                        //           .toDate()),
                                        //   // snapshot.data!.docs[0]
                                        //   //     .get('tanggalPertandingan')
                                        //   //     .toString(),
                                        //   style: const TextStyle(fontSize: 12),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditPertandinganTerakhir(
                                          id: 'id',
                                          cabangolahraga: 'voli',
                                          imageUrl: '',
                                          docid: snapshot.data!.docs[0],
                                          data: snapshot.data!.docs[0]
                                              .get('voli'),
                                        ),
                                      ),
                                    ),
                                  },
                                  child: Container(
                                    width: 186,
                                    height: 134,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('voli')['tim1'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
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
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('voli')['tim2'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
                                            ),
                                            // Text(
                                            //         snapshot.data!.docs[0]
                                            //                 .get('futsal')[
                                            //             'tim1'],
                                            //         style: const TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold,
                                            //           fontSize: 12,
                                            //           color:
                                            //               Color(0xff142D4C),
                                            //         ),
                                            //       ),
                                          ],
                                        ),
                                        const SizedBox(height: 25),
                                        Stack(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xff142D4C),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Voli',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xffD7E9F7)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xffD7E9F7),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      Text(
                                                        snapshot.data!.docs[0]
                                                                .get('voli')[
                                                            'skor1'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      const Text(
                                                        '-',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        snapshot.data!.docs[0]
                                                                .get('voli')[
                                                            'skor2'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        // Text(
                                        //   DateFormat('EEEE, dd MMMM yyyy', 'id')
                                        //       .format((snapshot.data!.docs[0].get(
                                        //                   'tanggalPertandingan')
                                        //               as Timestamp)
                                        //           .toDate()),
                                        //   // snapshot.data!.docs[0]
                                        //   //     .get('tanggalPertandingan')
                                        //   //     .toString(),
                                        //   style: const TextStyle(fontSize: 12),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditPertandinganTerakhir(
                                          id: 'id',
                                          cabangolahraga: 'catur',
                                          imageUrl: '',
                                          docid: snapshot.data!.docs[0],
                                          data: snapshot.data!.docs[0]
                                              .get('catur'),
                                        ),
                                      ),
                                    ),
                                  },
                                  child: Container(
                                    width: 186,
                                    height: 134,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('catur')['tim1'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
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
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('catur')['tim2'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
                                            ),
                                            // Text(
                                            //         snapshot.data!.docs[0]
                                            //                 .get('futsal')[
                                            //             'tim1'],
                                            //         style: const TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold,
                                            //           fontSize: 12,
                                            //           color:
                                            //               Color(0xff142D4C),
                                            //         ),
                                            //       ),
                                          ],
                                        ),
                                        const SizedBox(height: 25),
                                        Stack(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xff142D4C),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Catur',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xffD7E9F7)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xffD7E9F7),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      Text(
                                                        snapshot.data!.docs[0]
                                                                .get('catur')[
                                                            'skor1'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      const Text(
                                                        '-',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        snapshot.data!.docs[0]
                                                                .get('catur')[
                                                            'skor2'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        // Text(
                                        //   DateFormat('EEEE, dd MMMM yyyy', 'id')
                                        //       .format((snapshot.data!.docs[0].get(
                                        //                   'tanggalPertandingan')
                                        //               as Timestamp)
                                        //           .toDate()),
                                        //   // snapshot.data!.docs[0]
                                        //   //     .get('tanggalPertandingan')
                                        //   //     .toString(),
                                        //   style: const TextStyle(fontSize: 12),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditPertandinganTerakhir(
                                          id: 'id',
                                          cabangolahraga: 'bulutangkis',
                                          imageUrl: '',
                                          docid: snapshot.data!.docs[0],
                                          data: snapshot.data!.docs[0]
                                              .get('bulutangkis'),
                                        ),
                                      ),
                                    ),
                                  },
                                  child: Container(
                                    width: 186,
                                    height: 134,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('bulutangkis')['tim1'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
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
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('bulutangkis')['tim2'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
                                            ),
                                            // Text(
                                            //         snapshot.data!.docs[0]
                                            //                 .get('futsal')[
                                            //             'tim1'],
                                            //         style: const TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold,
                                            //           fontSize: 12,
                                            //           color:
                                            //               Color(0xff142D4C),
                                            //         ),
                                            //       ),
                                          ],
                                        ),
                                        const SizedBox(height: 25),
                                        Stack(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xff142D4C),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Bulutangkis',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xffD7E9F7)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xffD7E9F7),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      Text(
                                                        snapshot.data!.docs[0].get(
                                                                'bulutangkis')[
                                                            'skor1'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      const Text(
                                                        '-',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        snapshot.data!.docs[0].get(
                                                                'bulutangkis')[
                                                            'skor2'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        // Text(
                                        //   DateFormat('EEEE, dd MMMM yyyy', 'id')
                                        //       .format((snapshot.data!.docs[0].get(
                                        //                   'tanggalPertandingan')
                                        //               as Timestamp)
                                        //           .toDate()),
                                        //   // snapshot.data!.docs[0]
                                        //   //     .get('tanggalPertandingan')
                                        //   //     .toString(),
                                        //   style: const TextStyle(fontSize: 12),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditPertandinganTerakhir(
                                          id: 'id',
                                          cabangolahraga: 'tenisMeja',
                                          imageUrl: '',
                                          docid: snapshot.data!.docs[0],
                                          data: snapshot.data!.docs[0]
                                              .get('tenisMeja'),
                                        ),
                                      ),
                                    ),
                                  },
                                  child: Container(
                                    width: 186,
                                    height: 134,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('tenisMeja')['tim1'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
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
                                            Text(
                                              snapshot.data!.docs[0]
                                                  .get('tenisMeja')['tim2'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff142D4C),
                                              ),
                                            ),
                                            // Text(
                                            //         snapshot.data!.docs[0]
                                            //                 .get('futsal')[
                                            //             'tim1'],
                                            //         style: const TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold,
                                            //           fontSize: 12,
                                            //           color:
                                            //               Color(0xff142D4C),
                                            //         ),
                                            //       ),
                                          ],
                                        ),
                                        const SizedBox(height: 25),
                                        Stack(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xff142D4C),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Tenis Meja',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xffD7E9F7)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 75,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xffD7E9F7),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      Text(
                                                        snapshot.data!.docs[0]
                                                                .get(
                                                                    'tenisMeja')[
                                                            'skor1'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      const Text(
                                                        '-',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        snapshot.data!.docs[0]
                                                                .get(
                                                                    'tenisMeja')[
                                                            'skor2'],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff142D4C),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        // Text(
                                        //   DateFormat('EEEE, dd MMMM yyyy', 'id')
                                        //       .format((snapshot.data!.docs[0].get(
                                        //                   'tanggalPertandingan')
                                        //               as Timestamp)
                                        //           .toDate()),
                                        //   // snapshot.data!.docs[0]
                                        //   //     .get('tanggalPertandingan')
                                        //   //     .toString(),
                                        //   style: const TextStyle(fontSize: 12),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
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
      child: Image.asset(icon),
    );
  }
}
