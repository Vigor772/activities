import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/models/item_model.dart';

class TypicodeHttpClient {
  Future<List<ItemModel>> read() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');

    final response = await http.get(uri);

    final body = response.body;
    final json = jsonDecode(body); // List<dynamic>
    final list = List<Map<String, dynamic>>.from(json).map((json) {
      return ItemModel.fromJson(json);
    }).toList();

    return list;
  }
}
