import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controller/itemcomponents/itemgridview.dart';

import '../../size_config.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ItemGridView();
  }
}
