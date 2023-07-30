import 'package:oruphones/models/model.dart';
import 'package:oruphones/services/remoteservice.dart';
import 'package:get/get.dart';
import 'dart:convert';

class ItemController extends GetxController {
  var isLoading = true.obs;
  var isAddLoading = false.obs;
  var itemList = List<Listing>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchItem(1);
    super.onInit();
  }

  void fetchItem(int start) async {
    try {
      isLoading(true);
      itemList.clear();
      var response = await RemoteServices.fetchItem(start);
      if (response.statusCode == 200) {
        DataModel items = DataModel.fromJson(json.decode(response.body));
        itemList.assignAll(items.listings);
        print(itemList);
        print("done");
      }
    } finally {
      isLoading(false);
    }
  }

  void addItem(int start) async {
    try {
      isAddLoading(true);
      var response = await RemoteServices.fetchItem(start);
      if (response.statusCode == 200) {
        DataModel items = DataModel.fromJson(response.body);
        itemList.addAll(items.listings);
      }
    } finally {
      isAddLoading(false);
    }
  }
}
