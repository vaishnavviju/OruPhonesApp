import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<dynamic> fetchItem(int start) async {
    String url =
        "https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=${start.toString()}&limit=10";
    var response = await client.get(
      Uri.parse(url),
    );
    print(response.body);
    return response;
  }
}
