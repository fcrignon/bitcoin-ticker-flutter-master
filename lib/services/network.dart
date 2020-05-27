import 'package:http/http.dart';
import 'dart:convert';

class Network {
  final String url;


  Network(this.url);

  Future getData() async {
    print('calling uri: $url');
    Response response = await get(url);
    if (response.statusCode == 200) {
      print('starting loading data');
      var data = jsonDecode(response.body);
      return data;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post ${response.statusCode}');
    }
  }
}