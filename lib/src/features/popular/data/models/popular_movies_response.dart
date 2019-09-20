import 'package:fmovies/src/features/popular/data/models/movie.dart';

class PopularMoviesResponse {
  int page;
  int totalResults;
  int totalPages;
  List<Movie> results;

  PopularMoviesResponse(
      {this.page, this.totalResults, this.totalPages, this.results});

  PopularMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = new List<Movie>();
      json['results'].forEach((v) {
        results.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}