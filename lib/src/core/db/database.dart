import 'package:fmovies/src/features/popular/data/models/movie.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

@UseMoor(tables: [Movies], daos: [MoviesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'),
        );

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Movies])
class MoviesDao extends DatabaseAccessor<AppDatabase> with _$MoviesDaoMixin {
  final AppDatabase db;

  MoviesDao(this.db) : super(db);

  Future<List<Movie>> getFavoriteMovies() => select(movies).get();

  Future insertMovie(Insertable<Movie> movie) => into(movies).insert(movie);

  Future deleteMovie(Movie movie) => delete(movies).delete(movie);

  Future<List<Movie>> getMovie(Movie movie) =>
      (select(movies)..where((m) => m.id.equals(movie.id))).get();
}
