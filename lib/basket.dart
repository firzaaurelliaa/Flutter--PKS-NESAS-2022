import 'package:akhir/edit_basket.dart';
import 'package:akhir/klasemen_basket.dart';
import 'package:akhir/page_belum_diatur.dart';
import 'package:flutter/material.dart';

class Basket extends StatelessWidget {
  const Basket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff142D4C),
        title: const Text('B A S K E T'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (const EditBasket())))
            },
            icon: const Icon(Icons.edit, size: 22),
          ),
        ],
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
                              builder: (context) =>
                                  const KlasemenBasket(),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const TabbarBody()),
                // ),
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
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset('assets/images/TKI.png')),
                        const SizedBox(height: 10),
                        const Text(
                          'RPL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    const Text(
                      '101 - 98',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/OKTP.png'),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'OTKP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
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
                              builder: (context) =>
                                  const PageBelumDiatur(),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const TabbarBody()),
                // ),
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
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset('assets/images/BDP.png')),
                        const SizedBox(height: 10),
                        const Text(
                          'BDP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    const Text(
                      '88 - 109',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/TBSM.png'),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'TBSM',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
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
                              builder: (context) => const PageBelumDiatur(),
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
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/TPM.png')),
                      const SizedBox(height: 10),
                      const Text(
                        'TPM',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  const Text(
                    '89 - 87',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/images/AKL.png'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'AKL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
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
                              builder: (context) => const PageBelumDiatur(),
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
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/DG.png')),
                      const SizedBox(height: 10),
                      const Text(
                        'DG',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  const Text(
                    '103 - 90',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/images/TKI.png'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'TKJ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
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
                              builder: (context) => const PageBelumDiatur(),
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
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/TL.png')),
                      const SizedBox(height: 10),
                      const Text(
                        'RPL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  const Text(
                    '98 - 100',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/images/TB.png'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'TB',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ]),
    );
  }
}
