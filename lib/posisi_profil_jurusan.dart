// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:akhir/edit_posisi.dart';

import 'package:flutter/material.dart';

class PosisiAkl extends StatelessWidget {
  const PosisiAkl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Futsal : Posisi Ke-2',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 25),
                    child: IconButton(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (EditPosisiAKL())))
                      },
                      icon: Icon(Icons.edit, size: 22),
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
                  margin: const EdgeInsets.only(left: 20),
                  padding: const EdgeInsets.only(top: 15),
                  child: const Text(
                    'Poin : \nMain : \nMenang : \nSeri : \nKalah:',
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
                        fontSize: 15,
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
                          children: const [
                            Text(
                              'Poin',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
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
                        Row(
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
                        Row(
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
                        Row(
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
