part of '../shared/shared_provider.dart';

final movieDataSourceProvider = Provider<MovieDatasource>(
  (ref) => MovieDatasource(),
);

final movieDataBaseProvider = Provider<MovieDatabase>(
  (ref) => MovieDatabase(),
);

final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  final movieDataSource = ref.watch(movieDataSourceProvider);
  final movieDataBase = ref.watch(movieDataBaseProvider);
  return MovieRepositoryImpl(
      datasource: movieDataSource, database: movieDataBase);
});


final movieUseCaseProvider = Provider<MovieUseCase>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieUseCase(repository: movieRepository);
});
