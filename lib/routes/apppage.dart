import 'package:oruphones/screens/item.dart';

import "../controller/itembinding.dart";
import '';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.ITEM,
      page: () => ItemScreen(),
      binding: ItemBinding(),
    ),
  ];
}
