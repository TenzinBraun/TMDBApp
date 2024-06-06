import 'package:tmdb_app/data/database/base_database.dart';
import 'package:tmdb_app/data/datasource/base_datasource.dart';

abstract class BaseRepository<Datasource extends BaseDatasource,
    Database extends BaseDatabase> {
  ///The abstract datasource represented by [BaseDatasource]
  final Datasource datasource;

  ///The abstract database represented by [BaseDatabase]
  final Database database;

  BaseRepository({required this.datasource, required this.database});
}
