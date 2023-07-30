import 'package:flutter/material.dart';

class QualitySearchButton extends StatelessWidget {
  const QualitySearchButton({
    super.key,
    this.txt,
    required this.img,
  });
  final String img;
  final String? txt;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/veri.png',
                width: 80,
                height: 80,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Text(
                txt!,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
