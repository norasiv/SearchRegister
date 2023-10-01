import 'dart:convert';
import 'package:http/http.dart' as http;

class DataFetcher {
  static Future<T> fetchData<T>(String apiUrl, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
