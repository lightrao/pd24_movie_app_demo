import 'package:flutter/material.dart';
import 'package:pd24_movie_app_demo/models/movie.dart';
import 'package:pd24_movie_app_demo/utils/movie_parser.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movieList = [];

  List<Movie> get movieList => _movieList;

  Future<void> loadMovies(BuildContext context) async {
    try {
      final jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/data/films.json');
      final movies = MovieParser.parse(jsonString);
      _movieList = movies;
      notifyListeners();
    } catch (e) {
      print('Error loading movies: $e');
    }
  }

  // List<Movie> loadMovies() {
  //   return _movieList;
  // }

  void addMovie(Movie movie) {
    _movieList.add(movie);
    notifyListeners();
  }

  void removeMovie(Movie movie) {
    _movieList.remove(movie);
    notifyListeners();
  }

  void updateMovie(Movie oldMovie, Movie newMovie) {
    final index = _movieList.indexOf(oldMovie);
    _movieList[index] = newMovie;
    notifyListeners();
  }

  void clearMovies() {
    _movieList.clear();
    notifyListeners();
  }

  int indexOf(Movie movie) {
    return _movieList.indexOf(movie);
  }
}
