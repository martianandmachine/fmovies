import 'dart:convert';

import 'package:fmovies/src/features/popular/data/models/movie.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

//class MoorMovies extends Table {
//
//  IntColumn get id => integer().autoIncrement()();
//
//}

@UseMoor(tables: [Movies], daos: [MoorMoviesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: true,
          ),
        );

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Movies])
class MoorMoviesDao extends DatabaseAccessor<AppDatabase>
    with _$MoorMoviesDaoMixin {
  final AppDatabase db;

  MoorMoviesDao(this.db) : super(db);

  Future<List<Movie>> getAllMovies() => select(movies).get();

  Future insertMovie(Insertable<Movie> movie) =>
      into(movies).insert(movie);
}
