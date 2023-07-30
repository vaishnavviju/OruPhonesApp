// To parse this JSON data, do
//
//     final filter = filterFromJson(jsonString);
import 'package:http/http.dart';
import 'dart:convert';

Filter filterFromJson(String str) => Filter.fromJson(json.decode(str));

String filterToJson(Filter data) => json.encode(data.toJson());

class Filter {
  Filters filters;
  String message;

  Filter({
    required this.filters,
    required this.message,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        filters: Filters.fromJson(json["filters"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "filters": filters.toJson(),
        "message": message,
      };
}

class Filters {
  List<String> make;
  List<String> condition;
  List<String> storage;
  List<String> ram;

  Filters({
    required this.make,
    required this.condition,
    required this.storage,
    required this.ram,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        make: List<String>.from(json["make"].map((x) => x)),
        condition: List<String>.from(json["condition"].map((x) => x)),
        storage: List<String>.from(json["storage"].map((x) => x)),
        ram: List<String>.from(json["ram"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "make": List<dynamic>.from(make.map((x) => x)),
        "condition": List<dynamic>.from(condition.map((x) => x)),
        "storage": List<dynamic>.from(storage.map((x) => x)),
        "ram": List<dynamic>.from(ram.map((x) => x)),
      };
}
