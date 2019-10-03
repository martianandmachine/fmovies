abstract class MoviesApiService {
  buildClient();

  getPopularMovies(int page);
  getMovieDetails(int movieId);
}
