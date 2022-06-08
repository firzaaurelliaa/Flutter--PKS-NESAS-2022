import 'package:akhir/pilihan_atas.dart';
import 'package:flutter/material.dart';

class EditPertandinganAKL extends StatefulWidget {
  const EditPertandinganAKL({Key? key}) : super(key: key);

  @override
  State<EditPertandinganAKL> createState() => _EditPertandinganAKLState();
}

class _EditPertandinganAKLState extends State<EditPertandinganAKL> {
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
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Sabtu',
                      style: TextStyle(
                        fontSize: 15,
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

                  // maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
                        fontSize: 15,
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
                  // maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Kelas 10',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: controllerss,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    prefixIcon: const Icon(Icons.school),
                    prefixText: 'Putra :',
                    contentPadding: const EdgeInsets.only(left: 10),
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
                      'Kelas 11',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: controllersss,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    prefixIcon: const Icon(Icons.school),
                    prefixText: 'Putra :',
                    contentPadding: const EdgeInsets.only(left: 10),
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
                      'Kelas 12',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: controllerssss,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    prefixIcon: const Icon(Icons.school),
                    prefixText: 'Putra :',
                    contentPadding: const EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
