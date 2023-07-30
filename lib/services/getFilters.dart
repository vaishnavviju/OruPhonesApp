import 'package:flutter/material.dart';
import 'package:oruphones/models/filter.dart';
import 'package:oruphones/models/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetFilters extends StatefulWidget {
  const GetFilters({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  State<GetFilters> createState() => _GetItemsState();
}

class _GetItemsState extends State<GetFilters> {
  @override
  void initState() {
    _getData();
  }

  Filter? datafromAPI;
  int page = 1;
  bool _isLoading = true;
  ScrollController controller = ScrollController();
  late String make;
  late String condition;
  late String ram;
  late String storage;

  _getData() async {
    try {
      String url =
          "https://dev2be.oruphones.com/api/v1/global/assignment/getFilters?isLimited=true";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        datafromAPI = Filter.fromJson(json.decode(res.body));
        if (datafromAPI == null) {
          return;
        }
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const CircularProgressIndicator();
    List<String> buttontype = [];

    if (datafromAPI != null) {
      if (widget.type == "make") {
        buttontype = datafromAPI!.filters.make;
      } else if (widget.type == "condition") {
        buttontype = datafromAPI!.filters.condition;
      } else if (widget.type == "ram") {
        buttontype = datafromAPI!.filters.ram;
      } else if (widget.type == "storage") {
        buttontype = datafromAPI!.filters.storage;
      }
      content = Container(
        height: 50,
        child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: buttontype.isEmpty
                        ? const CircularProgressIndicator()
                        : Text(buttontype[index],
                            style: const TextStyle(color: Colors.black)),
                    onPressed: () {},
                  )
                ],
              ),
            );
          },
          itemCount: buttontype.length,
        ),
      );
    }
    return content;
  }
}
