import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:oruphones/models/suggestion.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({Key? key, required this.searchItem}) : super(key: key);
  final String searchItem;

  @override
  State<Suggestions> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestions> {
  Suggestion? _futureSuggestion;
  bool _isLoading = true;
  void createSuggestion(String searchName) async {
    final response = await http.post(
      Uri.parse(
          'https://dev2be.oruphones.com/api/v1/global/assignment/searchModel'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "searchModel": searchName,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      _futureSuggestion = Suggestion.fromJson(jsonDecode(response.body));
      print("done");
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create suggestion.');
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    final content = _futureSuggestion == null
        ? ""
        : _futureSuggestion!.makes.length.toString();
    return ElevatedButton(
        onPressed: () {
          createSuggestion(widget.searchItem);
        },
        child: Text(_futureSuggestion != null
            ? _futureSuggestion!.models[0]
            : "loading"));
  }
}
