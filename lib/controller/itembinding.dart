import 'itemcontroller.dart';
import 'package:get/get.dart';

class ItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ItemController(), permanent: true);
  }
}
