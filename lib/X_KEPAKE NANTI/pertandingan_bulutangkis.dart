// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors



import 'package:flutter/material.dart';

class AKLPertandinganBulutangkis extends StatefulWidget {
  const AKLPertandinganBulutangkis({Key? key}) : super(key: key);

  @override
  State<AKLPertandinganBulutangkis> createState() =>
      _AKLPertandinganBulutangkisState();
}

class _AKLPertandinganBulutangkisState
    extends State<AKLPertandinganBulutangkis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 35, right: 35),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  // color: AppColors.hijau,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sabtu, 13 Juni 2022",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                              iconSize: 22,
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: SizedBox(height: 10),
                      ),
                      Expanded(
                        flex: 75,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffD7E9F7),
                          ),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 85,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 20,
                                              child: SizedBox(
                                                width: 45,
                                                height: 45,
                                                child: Image.asset(
                                                    'assets/images/AKL.png'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              flex: 80,
                                              child: Text(
                                                "Akutansi dan Keuangan Lembaga",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Text(
                                        "120",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 85,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 20,
                                              child: SizedBox(
                                                width: 45,
                                                height: 45,
                                                child: Image.asset(
                                                    'assets/images/OKTP.png'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              flex: 85,
                                              child: Text(
                                                "Otomatisasi Tata Kelola Perkantoran",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        "1",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  // color: AppColors.hijau,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Sabtu, 13 Juni 2022",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: SizedBox(height: 10),
                      ),
                      Expanded(
                        flex: 75,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffD7E9F7),
                          ),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 85,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 20,
                                              child: SizedBox(
                                                width: 45,
                                                height: 45,
                                                child: Image.asset(
                                                    'assets/images/AKL.png'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              flex: 80,
                                              child: Text(
                                                "Akutansi dan Keuangan Lembaga",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Text(
                                        "120",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 85,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 20,
                                              child: SizedBox(
                                                width: 45,
                                                height: 45,
                                                child: Image.asset(
                                                    'assets/images/OKTP.png'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              flex: 85,
                                              child: Text(
                                                "Otomatisasi Tata Kelola Perkantoran",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        "1",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  // color: AppColors.hijau,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Sabtu, 13 Juni 2022",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: SizedBox(height: 10),
                      ),
                      Expanded(
                        flex: 75,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffD7E9F7),
                          ),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 85,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 20,
                                              child: SizedBox(
                                                width: 45,
                                                height: 45,
                                                child: Image.asset(
                                                    'assets/images/AKL.png'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              flex: 80,
                                              child: Text(
                                                "Akutansi dan Keuangan Lembaga",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Text(
                                        "120",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 85,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 20,
                                              child: SizedBox(
                                                width: 45,
                                                height: 45,
                                                child: Image.asset(
                                                    'assets/images/OKTP.png'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              flex: 85,
                                              child: Text(
                                                "Otomatisasi Tata Kelola Perkantoran",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        "1",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  // color: AppColors.hijau,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Sabtu, 13 Juni 2022",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: SizedBox(height: 10),
                      ),
                      Expanded(
                        flex: 75,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffD7E9F7),
                          ),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 85,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 20,
                                              child: SizedBox(
                                                width: 45,
                                                height: 45,
                                                child: Image.asset(
                                                    'assets/images/AKL.png'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              flex: 80,
                                              child: Text(
                                                "Akutansi dan Keuangan Lembaga",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Text(
                                        "120",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 85,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 20,
                                              child: SizedBox(
                                                width: 45,
                                                height: 45,
                                                child: Image.asset(
                                                    'assets/images/OKTP.png'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              flex: 85,
                                              child: Text(
                                                "Otomatisasi Tata Kelola Perkantoran",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Text(
                                        "192",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
