import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class ContentApi {
  static var client = http.Client();

  static Future<List<Product>> getNewPost() async {
    List<Product> posts = [];
    var response = await http.get(
        Uri.parse("https://mocki.io/v1/02e91d9f-4d8c-4eb4-a4f9-bb4a60ffdaf9"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['products'] as List;
      // posts = data
      //     .map((postJson) => Product.fromJson(postJson))
      //     .cast<ModelClass>()
      //     .toList();
      posts = data.map((postJson) => Product.fromJson(postJson)).toList();
      // print(jsonDecode(response.body)['products']);
      // print(posts[0].toString());
    } else {
      print('Error fetching products');
    }

    return posts;
  }
}
