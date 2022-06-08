import 'package:akhir/klasemen_futsal.dart';
import 'package:akhir/statistik_rpl_otkp.dart';
import 'package:akhir/tab_bar_futsal.dart';
import 'package:flutter/material.dart';

class Futsal extends StatelessWidget {
  const Futsal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        title: const Text('F U T S A L'),
        centerTitle: true,
      ),
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff142D4C),
                      ),
                      padding: const EdgeInsets.all(3),
                      width: 110,
                      height: 30,
                      child: const Center(
                        child: Text(
                          'F U  L L   T I M E',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      'Kamis, 20 April 2022',
                      style: TextStyle(
                          color: Color.fromARGB(255, 53, 53, 53),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KlasemenFutsal(),
                            ),
                          ),
                        },
                    child: const Text(
                      'Lihat detail',
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabbarBody()),
                ),
              },
              child: Container(
                width: 352,
                height: 144,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            child: Image.asset('assets/images/TKI.png')),
                        const SizedBox(height: 10),
                        const Text(
                          'RPL',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Text(
                      '1 - 1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/OKTP.png'),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'OTKP',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff142D4C),
                      ),
                      padding: const EdgeInsets.all(3),
                      width: 110,
                      height: 30,
                      child: const Center(
                        child: Text(
                          'F U  L L   T I M E',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      'Kamis, 20 April 2022',
                      style: TextStyle(
                          color: Color.fromARGB(255, 53, 53, 53),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KlasemenFutsal(),
                            ),
                          ),
                        },
                    child: const Text(
                      'Lihat detail',
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            ),
            Container(
              width: 352,
              height: 144,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/TKI.png')),
                      const SizedBox(height: 10),
                      const Text(
                        'RPL',
                      ),
                    ],
                  ),
                  const Text(
                    '1 - 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/images/OKTP.png'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'OTKP',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff142D4C),
                      ),
                      padding: const EdgeInsets.all(3),
                      width: 110,
                      height: 30,
                      child: const Center(
                        child: Text(
                          'F U  L L   T I M E',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      'Kamis, 20 April 2022',
                      style: TextStyle(
                          color: Color.fromARGB(255, 53, 53, 53),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KlasemenFutsal(),
                            ),
                          ),
                        },
                    child: const Text(
                      'Lihat detail',
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            ),
            Container(
              width: 352,
              height: 144,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/TKI.png')),
                      const SizedBox(height: 10),
                      const Text(
                        'RPL',
                      ),
                    ],
                  ),
                  const Text(
                    '1 - 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/images/OKTP.png'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'OTKP',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff142D4C),
                      ),
                      padding: const EdgeInsets.all(3),
                      width: 110,
                      height: 30,
                      child: const Center(
                        child: Text(
                          'F U  L L   T I M E',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      'Kamis, 20 April 2022',
                      style: TextStyle(
                          color: Color.fromARGB(255, 53, 53, 53),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KlasemenFutsal(),
                            ),
                          ),
                        },
                    child: const Text(
                      'Lihat detail',
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            ),
            Container(
              width: 352,
              height: 144,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/TKI.png')),
                      const SizedBox(height: 10),
                      const Text(
                        'RPL',
                      ),
                    ],
                  ),
                  const Text(
                    '1 - 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/images/OKTP.png'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'OTKP',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff142D4C),
                      ),
                      padding: const EdgeInsets.all(3),
                      width: 110,
                      height: 30,
                      child: const Center(
                        child: Text(
                          'F U  L L   T I M E',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      'Kamis, 20 April 2022',
                      style: TextStyle(
                          color: Color.fromARGB(255, 53, 53, 53),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KlasemenFutsal(),
                            ),
                          ),
                        },
                    child: const Text(
                      'Lihat detail',
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            ),
            Container(
              width: 352,
              height: 144,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/TKI.png')),
                      const SizedBox(height: 10),
                      const Text(
                        'RPL',
                      ),
                    ],
                  ),
                  const Text(
                    '1 - 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/images/OKTP.png'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'OTKP',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
