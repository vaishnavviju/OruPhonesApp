// To parse this JSON data, do
//
//     final DataModel = DataModelFromJson(jsonString);

import 'dart:convert';

DataModel DataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String DataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  List<Listing> listings;
  String nextPage;
  String message;

  DataModel({
    required this.listings,
    required this.nextPage,
    required this.message,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        listings: List<Listing>.from(
            json["listings"].map((x) => Listing.fromJson(x))),
        nextPage: json["nextPage"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "listings": List<dynamic>.from(listings.map((x) => x.toJson())),
        "nextPage": nextPage,
        "message": message,
      };
}

class Listing {
  String id;
  String deviceCondition;
  String listedBy;
  String deviceStorage;
  List<itemImage> images;
  itemImage defaultImage;
  String listingLocation;
  Make make;
  MarketingName marketingName;
  String mobileNumber;
  String model;
  bool verified;
  Status status;
  String listingDate;
  String deviceRam;
  String createdAt;
  String listingId;
  int listingNumPrice;
  String listingState;

  Listing({
    required this.id,
    required this.deviceCondition,
    required this.listedBy,
    required this.deviceStorage,
    required this.images,
    required this.defaultImage,
    required this.listingLocation,
    required this.make,
    required this.marketingName,
    required this.mobileNumber,
    required this.model,
    required this.verified,
    required this.status,
    required this.listingDate,
    required this.deviceRam,
    required this.createdAt,
    required this.listingId,
    required this.listingNumPrice,
    required this.listingState,
  });

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        id: json["_id"],
        deviceCondition: json["deviceCondition"],
        listedBy: json["listedBy"],
        deviceStorage: json["deviceStorage"],
        images: List<itemImage>.from(
            json["images"].map((x) => itemImage.fromJson(x))),
        defaultImage: itemImage.fromJson(json["defaultImage"]),
        listingLocation: json["listingLocation"],
        make: makeValues.map[json["make"]]!,
        marketingName: marketingNameValues.map[json["marketingName"]]!,
        mobileNumber: json["mobileNumber"],
        model: json["model"],
        verified: json["verified"],
        status: statusValues.map[json["status"]]!,
        listingDate: json["listingDate"],
        deviceRam: json["deviceRam"],
        createdAt: json["createdAt"],
        listingId: json["listingId"],
        listingNumPrice: json["listingNumPrice"],
        listingState: json["listingState"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "deviceCondition": deviceCondition,
        "listedBy": listedBy,
        "deviceStorage": deviceStorage,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "defaultImage": defaultImage.toJson(),
        "listingLocation": listingLocation,
        "make": makeValues.reverse[make],
        "marketingName": marketingNameValues.reverse[marketingName],
        "mobileNumber": mobileNumber,
        "model": model,
        "verified": verified,
        "status": statusValues.reverse[status],
        "listingDate": listingDate,
        "deviceRam": deviceRam,
        "createdAt": createdAt,
        "listingId": listingId,
        "listingNumPrice": listingNumPrice,
        "listingState": listingState,
      };
}

class itemImage {
  String fullImage;

  itemImage({
    required this.fullImage,
  });

  factory itemImage.fromJson(Map<String, dynamic> json) => itemImage(
        fullImage: json["fullImage"],
      );

  Map<String, dynamic> toJson() => {
        "fullImage": fullImage,
      };
}

enum Make { APPLE }

final makeValues = EnumValues({"Apple": Make.APPLE});

enum MarketingName { APPLE_I_PHONE_13_PRO }

final marketingNameValues =
    EnumValues({"Apple iPhone 13 Pro": MarketingName.APPLE_I_PHONE_13_PRO});

enum Status { ACTIVE, SOLD_OUT }

final statusValues =
    EnumValues({"Active": Status.ACTIVE, "Sold_Out": Status.SOLD_OUT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
