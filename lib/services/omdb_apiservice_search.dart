// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:http/http.dart' as http;

class OmdbApiService_search {
  final String apiKey = '8fd19a0f';
  final String baseUrl = 'http://www.omdbapi.com/';

  Future<List<dynamic>> searchMovies(String query) async {
    final Uri url = Uri.parse('$baseUrl?apikey=$apiKey&s=$query');
    
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['Response'] == 'True') {
        return data['Search'] ?? [];
      } else {
        throw Exception(data['Error'] ?? 'No movies found');
      }
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
