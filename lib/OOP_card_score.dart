// ignore_for_file: file_names

import 'package:akhir/tab_bar_futsal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OOPCardScore extends StatelessWidget {
  final String tim1;
  final String tim2;
  final String skor1;
  final String skor2;
  final String tanggal;
  final String logo1;
  final String logo2;
  final DocumentSnapshot documentSnapshot;
  final String id;

  const OOPCardScore({
    Key? key,
    required this.tim1,
    required this.tim2,
    required this.skor1,
    required this.skor2,
    required this.tanggal,
    required this.logo1,
    required this.logo2,
    required this.documentSnapshot,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                Text(
                  tanggal,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 53, 53, 53),
                  ),
                ),
                // Text(
                //   snapshot.data!.docs[index]
                //       .get('futsal')['tanggal'],
                //   style: TextStyle(
                // color: Color.fromARGB(255, 53, 53, 53),
                // fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TabbarBody(
                            doc: documentSnapshot,
                            id: id,
                          ),
                        ),
                      ),
                    },
                child: const Text(
                  'Lihat DFJDJ',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                )),
          ],
        ),
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (_) => FormListFutsal(
            //               docid: snapshot.data!.docs[index],
            //               imageUrl: '',
            //             )));
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
                      child: Image.network(logo1, loadingBuilder:
                          (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: const Color(0xff142D4C),
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      tim1,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      skor1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '-',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      skor2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(logo2, loadingBuilder:
                          (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: const Color(0xff142D4C),
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      tim2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
