abstract class SearchEvent {}

class Search extends SearchEvent {
  final String query;

  Search({required this.query});
}

class Load extends SearchEvent {}
