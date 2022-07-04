import 'package:akhir/page_belum_diatur.dart';
import 'package:flutter/material.dart';


class KlasemenBulutangkis extends StatelessWidget {
  const KlasemenBulutangkis({Key? key}) : super(key: key);

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
                        builder: (context) => (const PageBelumDiatur())))
              },
              icon: const Icon(Icons.edit, size: 22),
            ),
          ],
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff142D4C),
          elevation: 0,
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  color: const Color(0xff142D4C),
                  
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 150,
                    
                      child: Image.asset('assets/images/logopks.png'),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('Klasemen Bulutangkis', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),),
                    ],
                  ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'No.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('Jurusan',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      const Expanded(
                        flex: 7,
                        child: SizedBox(width: 15),
                      ),
                      Expanded(
                          flex: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'M',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'M',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'S',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'K',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Poin',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // OOPKlasemen(
                  //   no: '1.',
                  //   logo: Image.asset('assets/images/TKI.png'),
                  //   jurusan: 'RPL',
                  //   main: '2',
                  //   menang: '2',
                  //   seri: '1',
                  //   kalah: '1',
                  //   poin: '14',
                  // ),
                  // OOPKlasemen(
                  //   no: '2.',
                  //   logo: Image.asset('assets/images/AKL.png'),
                  //   jurusan: 'AKL',
                  //   main: '2',
                  //   menang: '2',
                  //   seri: '1',
                  //   kalah: '1',
                  //   poin: '2',
                  // ),
                  // OOPKlasemen(
                  //   no: '3.',
                  //   logo: Image.asset('assets/images/OKTP.png'),
                  //   jurusan: 'RPL',
                  //   main: '2',
                  //   menang: '2',
                  //   seri: '1',
                  //   kalah: '1',
                  //   poin: '8',
                  // ),
                  // OOPKlasemen(
                  //   no: '4.',
                  //   logo: Image.asset('assets/images/BDP.png'),
                  //   jurusan: 'BDP',
                  //   main: '2',
                  //   menang: '2',
                  //   seri: '1',
                  //   kalah: '1',
                  //   poin: '21',
                  // ),
                ],
              ),
            ),
          ],
        ));
  }
}
