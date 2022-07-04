// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors


import 'package:flutter/material.dart';

class UserAKLPertandinganTenisMeja extends StatefulWidget {
  const UserAKLPertandinganTenisMeja({Key? key}) : super(key: key);

  @override
  State<UserAKLPertandinganTenisMeja> createState() =>
      _UserAKLPertandinganTenisMejaState();
}

class _UserAKLPertandinganTenisMejaState
    extends State<UserAKLPertandinganTenisMeja> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Sabtu, 13 Juni 2022',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 343,
                height: 118,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffD7E9F7),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/images/AKL.png'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: const Text(
                                "Akutansi dan Keuangan Lembaga",
                                style: TextStyle(fontSize: 14.5),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            "2",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/images/OKTP.png'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: const Text(
                                'Otomatisasi Tata Kelola Perkantoran',
                                style: TextStyle(fontSize: 14.5),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            '1',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Sabtu, 13 Juni 2022',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 343,
                height: 118,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffD7E9F7),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/images/BDP.png'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: const Text(
                                "Bisnis Daring dan Pemasaran",
                                style: TextStyle(fontSize: 14.5),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            "2",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/images/AKL.png'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: const Text(
                                'Akutansi dan Keuangan Lembaga',
                                style: TextStyle(fontSize: 14.5),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            '1',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Sabtu, 13 Juni 2022',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 343,
                height: 118,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffD7E9F7),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/images/AKL.png'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: const Text(
                                "Akutansi dan Keuangan Lembaga",
                                style: TextStyle(fontSize: 14.5),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/images/TKI.png'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: const Text(
                                'Rekayasa Perangkat Lunak',
                                style: TextStyle(fontSize: 14.5),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            '2',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Sabtu, 13 Juni 2022',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 343,
                height: 118,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffD7E9F7),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/images/TPM.png'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: const Text(
                                "Teknik Pemesinan",
                                style: TextStyle(fontSize: 14.5),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/images/AKL.png'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: const Text(
                                'Akutansi dan Keuangan Lembaga',
                                style: TextStyle(fontSize: 14.5),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            '2',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }
}
