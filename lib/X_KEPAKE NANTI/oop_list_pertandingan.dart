
import 'package:flutter/material.dart';

class OopListPertandinganTerakhir extends StatelessWidget {
  final String skor;
  final String tanggal;
  final String tim;
  final String cabor;

  // ignore: use_key_in_widget_constructors
  const OopListPertandinganTerakhir({
    required this.skor,
    required this.tanggal,
    required this.tim,
    required this.cabor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
          height: 88,
          decoration: BoxDecoration(
              color: const Color(0xffD7E9F7),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 40,
                child: Text(
                  skor,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Color(0xff142D4C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tanggal,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      tim,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff142D4C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      cabor,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 20,
                // child: IconButton(
                //   onPressed: () => {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => (const PageBelumDiatur())))
                //   },
                //   icon: const Icon(Icons.navigate_next),
                // ),
                child: Icon(Icons.navigate_next),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
