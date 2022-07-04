import 'package:flutter/material.dart';

class HomeScreenCoba extends StatelessWidget {
  const HomeScreenCoba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: const Text("Sign Out"),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}