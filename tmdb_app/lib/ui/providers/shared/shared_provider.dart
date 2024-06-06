import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_app/data/repositories/tv_show/tv_show_repository_impl.dart';
import 'package:tmdb_app/domain/usecases/tv_show/get_series.dart';
import 'package:tmdb_app/domain/usecases/tv_show/tv_show_use_case.dart';

import '../../../config/navigation/app_routing.dart';
import '../../../data/database/movie/movie_database.dart';
import '../../../data/database/tv_show/tv_show_database.dart';
import '../../../data/datasource/movie/movie_datasource.dart';
import '../../../data/datasource/tv_show/tv_show_datasource.dart';
import '../../../data/repositories/movie/movie_repository_impl.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/movies/get_favorite_movies.dart';
import '../../../domain/usecases/movies/get_movies.dart';
import '../../../domain/usecases/movies/movie_use_case.dart';
import '../../../domain/usecases/movies/set_favorite_movie.dart';
import '../../../domain/usecases/movies/show_detail_movie.dart';
import '../../../domain/usecases/use_case.dart';

part '../movie/movie_provider.dart';

part '../tv_show/tv_show_provider.dart';

part 'movie_notifier.dart';

final movieProvider = AsyncNotifierProvider<MovieNotifier, MovieState>(() {
  return MovieNotifier();
});
