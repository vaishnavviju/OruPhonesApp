import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:oruphones/screens/item.dart';
import 'package:oruphones/services/getFilters.dart';

import 'package:oruphones/widgets/imagecarousal.dart';
import 'package:oruphones/widgets/productsearchbutton.dart';
import 'package:oruphones/widgets/qualitysearchbutton.dart';
import 'package:oruphones/widgets/tabheadings.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.loc}) : super(key: key);
  final String loc;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController makeController = ScrollController();
  final _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TabHeadings(txt: "Buy Top Brands"),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductSearchButton(img: 'assets/apple.png'),
                ProductSearchButton(img: 'assets/Samsung.jpg'),
                ProductSearchButton(img: 'assets/mi.png'),
                ProductSearchButton(img: 'assets/vivo.jpg')
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Stack(
              children: [
                Carousel(carouselController: _carouselController),
                Positioned(
                  top: 130,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                stops: [0.0, 1.0],
                                begin: FractionalOffset.bottomLeft,
                                end: FractionalOffset.topRight,
                                colors: [
                                  Color.fromARGB(255, 32, 31, 46),
                                  Color.fromARGB(255, 88, 93, 117),
                                ])),
                        height: 120,
                        width: 190,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Sell your phone in few steps",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                minimumSize: const Size.fromHeight(30),
                                backgroundColor: Colors.amber,
                              ),
                              child: const Text(
                                "Sell Now +",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              top: 10, left: 15, right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  stops: [0.0, 1.0],
                                  begin: FractionalOffset.bottomLeft,
                                  end: FractionalOffset.topRight,
                                  colors: [
                                    Color.fromARGB(255, 196, 196, 196),
                                    Color.fromARGB(255, 255, 255, 255),
                                  ])),
                          height: 120,
                          width: 190,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Buy your dream phone in few steps",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    minimumSize: const Size.fromHeight(30),
                                    backgroundColor:
                                        const Color.fromARGB(255, 32, 31, 46),
                                  ),
                                  child: const Text(
                                    "Buy Now >",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.white),
                                  ))
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
            const TabHeadings(txt: "Shop By"),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                QualitySearchButton(
                    img: 'assets/bestseller.jpg', txt: "Bestselling Mobiles"),
                QualitySearchButton(
                    img: 'assets/veri.png', txt: "Verified Devices Only"),
                QualitySearchButton(
                    img: 'assets/newphone.png', txt: "Like New Condition"),
                QualitySearchButton(
                    img: 'assets/warranty.jpg', txt: "Phones with warranty"),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const TabHeadings(txt: "Best Deals Near You"),
              Text(
                widget.loc,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    constraints: BoxConstraints(
                        minHeight: 0,
                        maxWidth: MediaQuery.of(context).size.width),
                    useSafeArea: true,
                    isScrollControlled: true,
                    isDismissible: true,
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Filters",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Clear Filters",
                                  style: TextStyle(color: Colors.orange),
                                ),
                              )
                            ],
                          ),
                          const TabHeadings(txt: "Brand"),
                          const GetFilters(type: "make"),
                          const TabHeadings(txt: "Ram"),
                          const GetFilters(type: "ram"),
                          const TabHeadings(txt: "Storage"),
                          const GetFilters(type: "storage"),
                          const TabHeadings(txt: "Conditions"),
                          const GetFilters(
                            type: "condition",
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Apply",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.mode_edit,
                  color: Colors.black,
                ),
                label: const Text(
                  "Filter",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ]),
            ItemScreen()
          ],
        ),
      ),
    );
  }
}
