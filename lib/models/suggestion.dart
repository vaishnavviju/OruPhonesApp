// To parse this JSON data, do
//
//     final suggestion = suggestionFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

Suggestion suggestionFromJson(String str) =>
    Suggestion.fromJson(json.decode(str));

String suggestionToJson(Suggestion data) => json.encode(data.toJson());

class Suggestion {
  List<String> makes;
  List<String> models;
  String message;

  Suggestion({
    required this.makes,
    required this.models,
    required this.message,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        makes: List<String>.from(json["makes"].map((x) => x)),
        models: List<String>.from(json["models"].map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "makes": List<dynamic>.from(makes.map((x) => x)),
        "models": List<dynamic>.from(models.map((x) => x)),
        "message": message,
      };
  static Future<List<Suggestion>> getMakeSuggestions(String query) async {
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/users?searchModel=${query}');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => Suggestion.fromJson(json)).where((user) {
        int x = 0;
        final makeLower = user.makes[x].toLowerCase();
        final modelLower = user.models[x].toLowerCase();
        final queryLower = query.toLowerCase();
        x++;
        return makeLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Suggestion>> getModelSuggestions(String query) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => Suggestion.fromJson(json)).where((user) {
        int x = 0;
        final makeLower = user.makes[x].toLowerCase();
        final modelLower = user.models[x].toLowerCase();
        final queryLower = query.toLowerCase();
        x++;
        return modelLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
