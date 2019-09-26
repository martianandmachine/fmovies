import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class MoorMovies extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();
}

@UseMoor(tables: [MoorMovies], daos: [MoorMoviesDao])
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

@UseDao(tables: [MoorMovies])
class MoorMoviesDao extends DatabaseAccessor<AppDatabase>
    with _$MoorMoviesDaoMixin {
  final AppDatabase db;

  MoorMoviesDao(this.db) : super(db);

  Future<List<MoorMovie>> getAllMovies() => select(moorMovies).get();

  Future insertMovie(Insertable<MoorMovie> movie) =>
      into(moorMovies).insert(movie);
}
