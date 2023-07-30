import 'package:flutter/material.dart';

class TabHeadings extends StatelessWidget {
  const TabHeadings({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
        child: Text(
          txt,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
