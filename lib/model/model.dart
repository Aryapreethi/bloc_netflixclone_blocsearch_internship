class Mylist {
  final String poster_path;
  final String original_title;
  final String backdrop_path;
  final String overview;
   final String release_date;

  Mylist(
      {required this.poster_path,
      required this.original_title,
      required this.backdrop_path,
      required this.overview,
      required this.release_date});

  factory Mylist.fromJson(Map<String, dynamic> json) {
    return Mylist(poster_path:json ['poster_path'],
     original_title: json['original_title'], 
     backdrop_path: json['backdrop_path'], 
     overview: json['overview'],
      release_date: json ['release_date']);
  }
}
