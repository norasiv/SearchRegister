import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterproj/models/company.dart';

class DataFetcher {
  static Future<Entity> fetchData(String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('_embedded') &&
            data['_embedded'].containsKey('enheter') &&
            data['_embedded']['enheter'].isNotEmpty) {
          final entity = Entity.fromJson(data);
          return entity;
        } else {
          throw Exception('Data not found in the API response');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
