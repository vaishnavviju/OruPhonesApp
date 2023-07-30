import 'package:flutter/material.dart';

class ProductSearchButton extends StatelessWidget {
  const ProductSearchButton({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: SizedBox(
        width: 100,
        height: 70,
        child: Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              img,
            ),
          ),
        ),
      ),
    );
  }
}
