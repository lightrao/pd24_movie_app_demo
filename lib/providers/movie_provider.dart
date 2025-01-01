import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  final List<String> _movieList = <String>[
    'Movie 1',
    'Movie 2',
    'Movie 3',
    'Movie 4',
    'Movie 5',
    'Movie 6',
    'Movie 7',
    'Movie 8',
    'Movie 9',
    'Movie 10',
  ];

  List<String> get movieList => _movieList;

  List<String> loadMovies() {
    return _movieList;
  }

  void addMovie(String movie) {
    _movieList.add(movie);
    notifyListeners();
  }

  void removeMovie(String movie) {
    _movieList.remove(movie);
    notifyListeners();
  }

  void updateMovie(String oldMovie, String newMovie) {
    final index = _movieList.indexOf(oldMovie);
    _movieList[index] = newMovie;
    notifyListeners();
  }

  void clearMovies() {
    _movieList.clear();
    notifyListeners();
  }

  int indexOf(String movie) {
    return _movieList.indexOf(movie);
  }
}
