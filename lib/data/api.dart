import 'dart:convert';
import 'package:image_search/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '27205491-6286fb14dd303fa8d43a0c6dc';

  Future<List<Photo>> fetch(String query) async {
    final http.Response response = await http.get(
      Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'),
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
