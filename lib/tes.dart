// ignore_for_file: unnecessary_const

import 'package:akhir/pertandingan_akl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tes extends StatefulWidget {
  const Tes({Key? key}) : super(key: key);

  @override
  State<Tes> createState() => _TesState();
}

class _TesState extends State<Tes> {
  TextEditingController controller = TextEditingController();
  TextEditingController controllers = TextEditingController();
  TextEditingController controllerss = TextEditingController();
  TextEditingController controllersss = TextEditingController();
  TextEditingController controllerssss = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
        leading: IconButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PertandinganAKL(),
              ),
            ),
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      child: Image.asset('assets/images/AKL.png'),
                    ),
                    const Text(
                      'AKL',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: Text(
                          '2 : 1',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'OTKP',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      child: Image.asset('assets/images/OKTP.png'),
                    ),
                    IconButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Tes1(),
                          ),
                        ),
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                        color: const Color(0xff142D4C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      child: Image.asset('assets/images/AKL.png'),
                    ),
                    const Text(
                      'AKL',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: Text(
                          '2 : 1',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'TPM',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      child: Image.asset('assets/images/TPM.png'),
                    ),
                    IconButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Tes1(),
                          ),
                        ),
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                        color: const Color(0xff142D4C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      child: Image.asset('assets/images/AKL.png'),
                    ),
                    const Text(
                      'AKL',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: Text(
                          '0 : 0',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'TBSM',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      child: Image.asset('assets/images/TBSM.png'),
                    ),
                    IconButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Tes1(),
                          ),
                        ),
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                        color: const Color(0xff142D4C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      child: Image.asset('assets/images/AKL.png'),
                    ),
                    const Text(
                      'AKL',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: Text(
                          '1 : 3',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'RPL',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      child: Image.asset('assets/images/TKI.png'),
                    ),
                    IconButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Tes1(),
                          ),
                        ),
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                        color: const Color(0xff142D4C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
            ],
          )
        ],
      ),
    );
  }
}

class Tes1 extends StatefulWidget {
  const Tes1({Key? key}) : super(key: key);

  @override
  State<Tes1> createState() => _Tes1State();
}

class _Tes1State extends State<Tes1> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
        leading: IconButton(
          onPressed: () => {
            Navigator.pop((context)),
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/AKL.png'),
              ),

              // const SizedBox(
              //   width: 50,
              //   height: 50,
              //   child: Center(
              //     child: Text(
              //       '2 : 1',
              //       style: TextStyle(
              //         fontSize: 25,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/OKTP.png'),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(350, 38),
              textStyle:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              primary: const Color(0xff142D4C),
              onPrimary: Colors.white,
            ),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Tes(),
                ),
              ),
            },
            child: const Text(
              'Simpan',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 175),
            child: TextFormField(
              controller: controller,
              maxLength: 6,
              keyboardType: const TextInputType.numberWithOptions(),
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: InputDecoration(
                fillColor: const Color(0xffD7E9F7),
                filled: true,
                contentPadding: const EdgeInsets.only(left: 15),
                hintText: '2 : 1',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xff142D4C))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
