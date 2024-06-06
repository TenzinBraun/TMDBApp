import 'package:tmdb_app/data/model/tv_show/tv_show_model.dart';
import 'package:tmdb_app/domain/entities/movie.dart';

import '../../../domain/repositories/tv_show/tv_show_repository.dart';
import '../../model/movie/movie_model.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  TvShowRepositoryImpl({required super.datasource, required super.database});

  List<Movie> series = [];
  List<Movie> favoriteSeries = [];

  @override
  Future<List<Movie>> getFavoriteListOfModel() {
    // TODO: implement getFavoriteListOfModel
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getListOfModel() async {
    List<MovieModel> favoriteSeriesModels = [];
    try {
      favoriteSeriesModels = await database.getMovies();
    } catch (_) {}
    if (series.isEmpty) {
      final List<TvShowModel> movieModels = await datasource.fetchData();
      series = movieModels
          .map((e) => Movie(
              id: e.id,
              title: e.name,
              overview: e.overview,
              posterPath: e.posterPath,
              isFavorite:
                  favoriteSeriesModels.where((fm) => e.id == fm.id).isNotEmpty))
          .toList();
      favoriteSeries = favoriteSeriesModels
          .map(
            (e) => Movie(
              id: e.id,
              title: e.title,
              overview: e.overview,
              posterPath: e.posterPath,
              isFavorite: true,
            ),
          )
          .toList();
    } else {
      series = series
          .map((e) => Movie(
              id: e.id,
              title: e.title,
              overview: e.overview,
              posterPath: e.posterPath,
              isFavorite:
                  favoriteSeriesModels.where((fm) => e.id == fm.id).isNotEmpty))
          .toList();
    }
    return series;
  }

  @override
  Future<Movie> getMovieDetail(Movie params) {
    // TODO: implement getMovieDetail
    throw UnimplementedError();
  }

  @override
  Future<void> update(Movie movie) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
