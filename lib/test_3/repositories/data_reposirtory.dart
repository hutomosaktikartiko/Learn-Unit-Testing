import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/data_model.dart';

class DataRepository {
  Future<DataModel?> getData() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");

    try {
      final response = await http.get(uri);
      
      // Delayed
      await Future.delayed(const Duration(seconds: 3));

      return DataModel.fromJson(jsonDecode(response.body));
    } catch (_) {
      rethrow;
    }
  }
}