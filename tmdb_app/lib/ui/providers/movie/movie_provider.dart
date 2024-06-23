import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/database/movie_database.dart';
import '../../../data/datasource/movie_datasource.dart';
import '../../../data/repositories/movie_repository_impl.dart';
import 'movie_notifier.dart';
//
// final movieDataSourceProvider = Provider<MovieDatasource>(
//   (ref) => MovieDatasource(),
// );
//
// final movieDataBaseProvider = Provider<MovieDatabase>(
//   (ref) => MovieDatabase(),
// );
//
// final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
//   final movieDataSource = ref.watch(movieDataSourceProvider);
//   final movieDataBase = ref.watch(movieDataBaseProvider);
//   return MovieRepositoryImpl(
//       datasource: movieDataSource, database: movieDataBase);
// });

//
// final movieProvider = AsyncNotifierProvider<MovieNotifier, MovieState>(() {
//     return MovieNotifier();
// });
