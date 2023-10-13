import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net/core/const.dart';
import 'package:net/model/model.dart';
import 'package:net/screens/screens/search/searchbloc/SearchnewState.dart';
import 'package:net/screens/screens/search/searchbloc/searchnewEvent.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  List<Mylist> _items = [];

  SearchBloc() : super(SearchStateLoading()) {
    on<Load>(_LoadEvent);
    on<Search>(_SearchEvent);
  }

  Future<SearchState> _LoadEvent(
      Load event, Emitter<SearchState> emit) async {
    emit(SearchStateLoading());
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constant.api}'));
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
        print("_______________$_items");
        emit(SearchStateSuccess(items: _items));
        print(".....$_items");
        return SearchStateSuccess(items: _items);
      } else {
        return SearchStateError(message: "Something went wrong");
      }
    } catch (e) {
      return SearchStateError(message: e.toString());
    }
  }

  void _SearchEvent(Search event, Emitter<SearchState> emit) async {
    emit(SearchStateLoading());
    try {
      final filteredItems = _items
          .where(
            (u) => (u.original_title.toLowerCase().contains(
                  event.query.toLowerCase(),
                )),
          )
          .toList();
      emit(SearchStateSuccess(items: filteredItems));
      print("Load search success....$filteredItems");
    } catch (e) {
      emit(SearchStateError(message: e.toString()));
    }
  }
}
