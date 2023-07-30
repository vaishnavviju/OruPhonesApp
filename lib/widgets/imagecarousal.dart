import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  Carousel({Key? key, required this.carouselController}) : super(key: key);
  final CarouselController carouselController;
  @override
  State<Carousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<Carousel> {
  List<String> adList = [
    "assets/ad1.jpg",
    "assets/ad2.jpg",
  ];
  int _index = 0;

  Widget buildImage(String img, int index) {
    return Card(
      color: Colors.white,
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          img,
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: _index,
      count: adList.length,
      onDotClicked: (index) {
        widget.carouselController.jumpToPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: adList.length,
          carouselController: widget.carouselController,
          itemBuilder: (context, index, realIndex) {
            final img = adList[index];
            return buildImage(img, index);
          },
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              height: 250,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (val, _) {
                setState(() {
                  _index = val;
                  widget.carouselController.jumpToPage(val);
                });
              }),
        ),
        const SizedBox(
          height: 10,
        ),
        buildIndicator(),
      ],
    );
  }
}
