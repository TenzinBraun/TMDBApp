import 'package:tmdb_app/data/database/tv_show/tv_show_database.dart';
import 'package:tmdb_app/data/datasource/tv_show/tv_show_datasource.dart';
import 'package:tmdb_app/domain/repositories/base_repository.dart';

import '../../entities/movie.dart';

abstract class TvShowRepository
    extends BaseRepository<TvShowDatasource, TVShowDatabase, Movie> {
  TvShowRepository({required super.datasource, required super.database});
}
