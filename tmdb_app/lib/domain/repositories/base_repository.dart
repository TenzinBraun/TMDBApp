import 'package:tmdb_app/data/database/base_database.dart';
import 'package:tmdb_app/data/datasource/base_datasource.dart';

abstract class BaseRepository<Datasource extends BaseDatasource,
    Database extends BaseDatabase, Model> {
  ///The abstract datasource represented by [BaseDatasource]
  final Datasource datasource;

  ///The abstract database represented by [BaseDatabase]
  final Database database;

  BaseRepository({required this.datasource, required this.database});

  /// A method that retrieve a list of [Movie]
  /// @params: empty
  /// @return: return a [Future] that exposes a [List] of [Movie]
  Future<List<Model>> getListOfModel();

  /// A method that retrieve a the favorite list of [Movie]
  /// @params: empty
  /// @return: return a [Future] that exposes a [List] of [Movie]
  Future<List<Model>> getFavoriteListOfModel();

  /// A method that set a [Movie] as favorite
  /// @params: [movie],  the [Movie] selected
  /// @return: return a [Future] void
  Future<void> update(Model movie);

  /// A method that return the detail of a [Movie] selected
  /// @params: [movie],  the [Movie] selected
  /// @return: return a [Future] of [Movie]
  Future<Model> getMovieDetail(Model params);
}
