import 'package:net/core/const.dart';
import 'package:net/model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  List<Mylist> _items = [];
  List<Mylist> get items => _items;

  static const now_playing =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.api}';

  Future<List<Mylist>> getlistnowplaying() async {
    final response = await http.get(Uri.parse(now_playing));
    if (response.statusCode == 200) {
      final Map<String, dynamic> userlist = json.decode(response.body);
      final List<dynamic> data = userlist['results'];
      _items = data
          .map((e) => Mylist(
                poster_path: e['poster_path'],
                original_title: e['original_title'],
                backdrop_path: e['backdrop_path'],
                overview: e['overview'],
                release_date: e['release_date'],
              ))
          .toList();
      return _items;
    } else {
      throw Exception("Something went wrong");
    }
  }
     Future<List<Mylist>> gettoprated() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.api}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'] as List;
      print(data);
      return data
          .map((e) => Mylist(
              poster_path: e['poster_path'],
              original_title: e['original_title'],
              backdrop_path: e['backdrop_path'],
              overview: e['overview'],
              release_date: e['release_date']))
          .toList();
    } else {
      throw Exception("Something went wrong");
    }
  }
}
