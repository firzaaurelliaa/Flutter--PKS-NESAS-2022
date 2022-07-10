import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserOOPKlasemenNavbar extends StatelessWidget {
  final String no;

  final String jurusan;
  final String main;
  final String menang;
  final String seri;
  final String kalah;
  final String poin;
  final DocumentSnapshot id;

  // ignore: use_key_in_widget_constructors
  const UserOOPKlasemenNavbar({
    required this.no,
    required this.jurusan,
    required this.main,
    required this.menang,
    required this.seri,
    required this.kalah,
    required this.poin,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            const Expanded(
              flex: 5,
              child: SizedBox(width: 5),
            ),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(no),
                ],
              ),
            ),
            const Expanded(
              flex: 5,
              child: SizedBox(width: 5),
            ),
            // // Expanded(
            // //   flex: 8,
            // //   child: SizedBox(
            // //     width: 30,
            // //     height: 30,
            // //     child: logo,
            // //   ),
            // // ),
            // const Expanded(
            //   flex: 2,
            //   child: SizedBox(width: 2),
            // ),
            Expanded(
              flex: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: Text(
                    jurusan,
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ),
            ),

            Expanded(
                flex: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(main),
                    Text(menang),
                    Text(seri),
                    Text(kalah),
                    Text(poin),
                  ],
                )),
            Expanded(flex: 5, child: SizedBox(width: 5))
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
