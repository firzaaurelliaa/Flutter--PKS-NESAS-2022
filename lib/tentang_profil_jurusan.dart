// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'edit_tentang.dart';

class TentangAKL extends StatefulWidget {
  const TentangAKL({Key? key}) : super(key: key);

  @override
  State<TentangAKL> createState() => _TentangAKLState();
}

class _TentangAKLState extends State<TentangAKL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Tentang jurusan',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: IconButton(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (const EditTentang())))
                      },
                      icon: const Icon(Icons.edit, size: 22),
                    ),
                  ),
                ],
              ),
              Container(
                width: 343,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffD7E9F7),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Jurusan Akuntansi dan Keuangan Lembaga memberikan keterampilan kepada siswa/i untuk mengelola pencatatan keuangan dan membekali peserta dengan keterampilan akuntansi, mengelola transaksi keuangan sehingga be a good staff accounting.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
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
                      'Kejuaraan yang pernah diraih',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 343,
                height: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffD7E9F7),
                ),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Juara 1 National Accounting Competition \nJuara 1 Airlangga Accounting Competition \nJuara 2 Typing Speed \nJuara 3 Akutansi Indonesia',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Kelas 10',
                      style: TextStyle(
                        fontSize: 17,
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
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/images/man.png'),
                              ),
                              const Text(
                                'Putra',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            '32',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/images/man.png'),
                              ),
                              const Text(
                                'Putri',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            '18',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Kelas 11',
                      style: TextStyle(
                        fontSize: 17,
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
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/images/man.png'),
                              ),
                              const Text(
                                'Putra',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            '32',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/images/man.png'),
                              ),
                              const Text(
                                'Putri',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            '18',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Kelas 12',
                      style: TextStyle(
                        fontSize: 17,
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
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/images/man.png'),
                              ),
                              const Text(
                                'Putra',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            '32',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/images/man.png'),
                              ),
                              const Text(
                                'Putri',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            '18',
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
