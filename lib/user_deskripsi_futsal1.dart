
import 'package:flutter/material.dart';

class UserDeskripsiFutsal1 extends StatelessWidget {
  const UserDeskripsiFutsal1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff142D4C),
      body: Center(
        child: Container(
          width: 358,
          height: 401,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffD7E9F7),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text('DESKRIPSI PERTANDINGAN',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 17)),
                  ),
                  
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Pertandingan futsal antara jurusan RPL melawan OTKP yang berlangsung pada sore hari tadi berjalan begitu sengit. \n \nKedua tim enggan mengalah dan terus menancapkan gas kemenangan. \nPada babak pertama OTKP memimpin score dengan mencetak gol pada menit ke 5 berkat tendangan jarak jauh FIrza. \n \nNamun tim lawan tak tinggal diam, RPL mulai memanas setelah gol itu terjadi. Serangan demi serangan mulai diluncurkan. Hingga pada akhirnya RPL menyamakan kedudukan pada menit ke 12. Skor pun tak berubah hingga berakhirnya pertandingan.',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
