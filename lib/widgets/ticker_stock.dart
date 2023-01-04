import 'package:flutter/material.dart';

class TickerStock extends StatelessWidget {
  const TickerStock({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromRGBO(217, 217, 217, 1)),
        child: Text(title,
            style: const TextStyle(color: Colors.black, fontSize: 14)));
  }
}
