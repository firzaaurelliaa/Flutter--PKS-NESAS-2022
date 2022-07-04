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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 35),
                  SizedBox(
                    width: 210,
                    height: 35,
                    child: TextFormField(
                      controller: controllerss,
                      decoration: const InputDecoration(
                        fillColor: Color(0xffD7E9F7),
                        filled: true,
                        hintText: 'Atur tanggal pertandingan',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 343,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffD7E9F7),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.add_photo_alternate),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 210,
                          height: 35,
                          child: TextFormField(
                            controller: controllerss,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffD7E9F7),
                              filled: true,
                              // contentPadding: const EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xff142D4C))),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 45,
                          height: 35,
                          child: TextFormField(
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            controller: controllerss,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffD7E9F7),
                              filled: true,
                              // contentPadding: const EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xff142D4C))),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.add_photo_alternate),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 210,
                          height: 35,
                          child: TextFormField(
                            controller: controllerss,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffD7E9F7),
                              filled: true,
                              // contentPadding: const EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xff142D4C))),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 45,
                          height: 35,
                          child: TextFormField(
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            controller: controllerss,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffD7E9F7),
                              filled: true,
                              // contentPadding: const EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xff142D4C))),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 35),
                  SizedBox(
                    width: 210,
                    height: 35,
                    child: TextFormField(
                      controller: controllerss,
                      decoration: const InputDecoration(
                        fillColor: Color(0xffD7E9F7),
                        filled: true,
                        hintText: 'Atur tanggal pertandingan',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 343,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffD7E9F7),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.add_photo_alternate),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 210,
                          height: 35,
                          child: TextFormField(
                            controller: controllerss,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffD7E9F7),
                              filled: true,
                              // contentPadding: const EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xff142D4C))),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 45,
                          height: 35,
                          child: TextFormField(
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            controller: controllerss,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffD7E9F7),
                              filled: true,
                              // contentPadding: const EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xff142D4C))),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.add_photo_alternate),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 210,
                          height: 35,
                          child: TextFormField(
                            controller: controllerss,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffD7E9F7),
                              filled: true,
                              // contentPadding: const EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xff142D4C))),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 45,
                          height: 35,
                          child: TextFormField(
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            controller: controllerss,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffD7E9F7),
                              filled: true,
                              // contentPadding: const EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xff142D4C))),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 343,
                height: 25,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                            child: const Icon(Icons.add_circle_outline_sharp)),
                        const Text(
                          'Tambah pertandingan',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.delete),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
