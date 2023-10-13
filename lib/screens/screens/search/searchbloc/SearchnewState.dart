import 'package:net/model/model.dart';
// import 'package:net/screens/screens/search/searchbloc/searchnewEvent.dart';



abstract class SearchState {}


class SearchStateLoading extends SearchState {}
class SearchStateSuccess extends SearchState {
  final List<Mylist> items;
  SearchStateSuccess({required this.items});
List<Object?> get props =>[];
}

class SearchStateError extends SearchState {
  final String message;
  SearchStateError({required this.message});
}

