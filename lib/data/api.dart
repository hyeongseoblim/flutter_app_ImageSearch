import 'dart:convert';

import 'package:image_search/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=25199821-75535eaa2ca332af56cf31f6f&$query&image_type=photo&pretty=true'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
