
import 'package:akhir/user_akl_pertandingan_basket.dart';
import 'package:akhir/user_akl_pertandingan_bulutangkis.dart';
import 'package:akhir/user_akl_pertandingan_catur.dart';
import 'package:akhir/user_akl_pertandingan_futsal.dart';
import 'package:akhir/user_akl_pertandingan_tenismeja.dart';
import 'package:akhir/user_akl_pertandingan_voli.dart';

import 'package:flutter/material.dart';

class UserAKLPilihanPertandingan extends StatelessWidget {
  const UserAKLPilihanPertandingan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            const SizedBox(height: 10),
            TabBar(
              indicatorColor: const Color(0xff142D4C),
              isScrollable: true,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Container(
                    height: 35,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xff142D4C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Futsal',
                          style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 35,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xff142D4C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Basket',
                          style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 35,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xff142D4C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Voli',
                          style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 35,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xff142D4C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Catur',
                          style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 35,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xff142D4C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Bulutangkis',
                          style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 35,
                    width: 95,
                    decoration: BoxDecoration(
                      color: const Color(0xff142D4C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Tenis Meja',
                          style: TextStyle(
                            color: Color(0xfff6f6f6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Expanded(
              child: TabBarView(
                children: [
                  UserAKLPertandinganFutsal(),
                  UserAKLPertandinganBasket(),
                  UserAKLPertandinganVoli(),
                  UserAKLPertandinganCatur(),
                  UserAKLPertandinganBulutangkis(),
                  UserAKLPertandinganTenisMeja(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
