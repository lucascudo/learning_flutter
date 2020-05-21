import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this._url);

  final String _url;

  Future<dynamic> getData() async {
    http.Response response = await http.get(_url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      print('HTTP error: ${response.statusCode}');
      return null;
    }
  }
}
