import 'package:tmdb_app/data/datasource/base_datasource.dart';

import '../../../data/database/base_database.dart';
import '../../../data/database/movie/movie_database.dart';
import '../../../data/datasource/movie/movie_datasource.dart';
import '../../entities/movie.dart';
import '../base_repository.dart';

/// An abstract class that represents all the [UseCase] logic
/// of the [Movie] feature.
///
/// Extends [BaseRepository] with [MovieDatasource] and [MovieDatabase]
///
/// See also
///   - [getMovies] method.
///   - [update] method.
abstract class MovieRepository
    extends BaseRepository<MovieDatasource, MovieDatabase, Movie> {

  MovieRepository({required super.datasource, required super.database});

}
