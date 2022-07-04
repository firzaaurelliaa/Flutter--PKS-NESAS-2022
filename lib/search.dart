import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({Key? key}) : super(key: key);

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
         title: const Text('Percobaan Search'),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: _expanded ? MediaQuery.of(context).size.width - 20 : 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                boxShadow: kElevationToShadow[6]),
            child: Row(
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                    icon: Icon(
                        _expanded ? Icons.arrow_back_ios_new : Icons.search),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: _expanded
                      ? const TextField(
                          decoration: InputDecoration(
                              hintText: 'Cari', border: InputBorder.none),
                        )
                      : null,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


