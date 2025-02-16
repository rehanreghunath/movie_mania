// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:http/http.dart' as http;

class OmdbApiService_details {
  final String apiKey = '8fd19a0f';
  final String baseUrl = 'https://www.omdbapi.com/';

  Future<Map<String, dynamic>?> fetchMovieDetails(String title) async {
    final response = await http.get(
      Uri.parse('$baseUrl?apikey=$apiKey&t=$title'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // ignore: avoid_print
      print('Failed to load movie details');
      return null;
    }
  }
}
