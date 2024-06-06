part of '../shared/shared_provider.dart';

final tvShowDataSourceProvider = Provider<TvShowDatasource>(
  (ref) => TvShowDatasource(),
);

final tvShowDataBaseProvider = Provider<TVShowDatabase>(
  (ref) => TVShowDatabase(),
);

final tvRepositoryProvider = Provider<TvShowRepositoryImpl>((ref) {
  final tvShowDatasource = ref.watch(tvShowDataSourceProvider);
  final tvShowDatabase = ref.watch(tvShowDataBaseProvider);
  return TvShowRepositoryImpl(
      datasource: tvShowDatasource, database: tvShowDatabase);
});

final tvShowUseCaseProvider = Provider<TvShowUseCase>((ref) {
  final tvRepository = ref.watch(tvRepositoryProvider);
  return TvShowUseCase(repository: tvRepository);
});
