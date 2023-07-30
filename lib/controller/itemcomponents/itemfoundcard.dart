import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oruphones/models/model.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ItemCard extends StatefulWidget {
  ItemCard(this.item, {super.key});
  final Listing item;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool _isTap = false;
  @override
  Widget build(BuildContext context) {
    Listing useItem = widget.item;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 4,
              child: Center(
                child: Hero(
                  tag: "tagHero${useItem.id}",
                  child: Image.network(
                    useItem.defaultImage.fullImage,
                    fit: BoxFit.scaleDown,
                    height: getProportionateScreenHeight(150),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Expanded(
              flex: 3,
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Text(
                      "${this.widget.item.listingNumPrice}",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor,
                          fontSize: getProportionateScreenWidth(16)),
                      maxLines: 2,
                    ),
                    Container(
                        // margin: EdgeInsets.only(top: 10, bottom: 5),
                        child: this.widget.item.deviceRam != null
                            ? Text(
                                "LKR ${this.widget.item.model}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor,
                                    fontSize: 12),
                                maxLines: 1,
                              )
                            : Container()),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(this.widget.item.deviceRam,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 9.5)),
                          Text(
                              "Condition : ${this.widget.item.deviceCondition}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 9.5))
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Text(this.widget.item.listingLocation,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10)),
                          Text(this.widget.item.listingDate,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 10))
                        ]))
                  ])),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    _isTap = !_isTap;
                  });
                },
                icon: (!_isTap)
                    ? const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ))
          ],
        ),
      ),
    );
  }
}
