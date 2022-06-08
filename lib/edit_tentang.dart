import 'package:akhir/pilihan_atas.dart';
import 'package:akhir/tentang_profil_jurusan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditTentang extends StatefulWidget {
  const EditTentang({Key? key}) : super(key: key);

  @override
  State<EditTentang> createState() => _EditTentangState();
}

class _EditTentangState extends State<EditTentang> {
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
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: TextButton(
                onPressed: () => {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PilihanAtas(),
                        ),
                      ),
                    },
                child: const Text(
                  'Simpan',
                  style: const TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Tentang jurusan',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  maxLength: 200,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: controller,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: 'Tambahkan tentang jurusan',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Kejuaraan yang pernah diraih',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  maxLength: 50,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: controllers,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: 'Tambahkan kejuaraan yang pernah diraih',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 25),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'Kelas 10',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 25),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      'Putra :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 75),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      'Putri :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: controllerss,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffD7E9F7),
                        filled: true,
                        contentPadding: const EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Color(0xff142D4C))),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: controllerss,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffD7E9F7),
                        filled: true,
                        contentPadding: const EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Color(0xff142D4C))),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 25),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'Kelas 11',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 25),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      'Putra :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 75),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      'Putri :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: controllerss,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffD7E9F7),
                        filled: true,
                        contentPadding: const EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Color(0xff142D4C))),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: controllerss,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffD7E9F7),
                        filled: true,
                        contentPadding: const EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Color(0xff142D4C))),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 25),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'Kelas 12',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 25),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      'Putra :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 75),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      'Putri :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: controllerss,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffD7E9F7),
                        filled: true,
                        contentPadding: const EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Color(0xff142D4C))),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: controllerss,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffD7E9F7),
                        filled: true,
                        contentPadding: const EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Color(0xff142D4C))),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
