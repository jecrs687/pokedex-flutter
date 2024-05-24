import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class _SearchBar extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    "0".padLeft(2, '0');
    return Container(
        width: double.maxFinite,
        height: 90,
        child: Row(children: [
          Expanded(
              child: Container(
            constraints: const BoxConstraints(
              minWidth: 104,
              maxHeight: 108,
            ),
            width: Size.infinite.width,
            padding: const EdgeInsets.all(5),
            height: 50,
            margin: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white70,
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  IconData(0xe567, fontFamily: 'MaterialIcons'),
                  color: Colors.redAccent,
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: SizedBox(
                        height: 25,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.black12),
                              border: InputBorder.none,
                              fillColor: Colors.black),
                        )))
              ],
            ),
          )),
          Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              width: 40,
              alignment: Alignment.center,
              height: 40,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white70,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              // Button color
              child: const Text(
                '#',
                style: TextStyle(color: Colors.black12, fontSize: 20),
              )),
        ]));
  }
}

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBar();

  const SearchBar({Key? key}) : super(key: key);
}
