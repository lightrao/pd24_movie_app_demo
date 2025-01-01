import 'package:pd24_movie_app_demo/models/movie.dart';
import 'dart:convert';

class MovieParser {
  static List<Movie> parse(String jsonString) {
    final List<dynamic> parsedJsonList = json.decode(jsonString);
    return parsedJsonList
        .map((jsonItem) => Movie.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}
