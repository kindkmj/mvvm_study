import 'dart:convert';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '27205491-6286fb14dd303fa8d43a0c6dc';

  // https://pixabay.com/api/?key=27205491-6286fb14dd303fa8d43a0c6dc&q=ipone&image_type=photo
  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();
    final http.Response response = await client.get(
      Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'),
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
