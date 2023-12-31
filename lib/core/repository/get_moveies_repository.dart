

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movies_modal.dart';
import '../url/base_url.dart';

class GetMoveiesRepository {


  Future<List<MoviesModal>> getMovies() async {
    List<MoviesModal> movies = [];
    var response = await http.get(Uri.parse(BASE_URL));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      for (var item in jsonData) {
        movies.add(MoviesModal.fromJson(item));
      }
    }
    print('Movies: $movies');
    return movies;
  }

  Future<List<MoviesModal>> getFilteredMovies(String query) async {
    List<MoviesModal> movies = [];
    var response = await http
        .get(Uri.parse('$BASE_URL_QUERY$query'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      for (var item in jsonData) {
        movies.add(MoviesModal.fromJson(item));
      }
    }
    print('Movies: $movies');
    return movies;
  }
}
