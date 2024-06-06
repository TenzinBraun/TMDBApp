import 'package:tmdb_app/domain/repositories/tv_show/tv_show_repository.dart';
import 'package:tmdb_app/domain/usecases/tv_show/get_series.dart';

import '../use_case.dart';

class TvShowUseCase {
  final TvShowRepository repository;
  TvShowUseCase({required this.repository});


  /// A temporary generic function to call the proper [UseCase] call function based
  /// on its type [T]
  ///
  @Deprecated(
      "Will be remove in the future as we shouldn't use constant patterns with type literals.")
  Future<dynamic> call<T extends UseCase, P extends UseCaseParams>(
      P params) async {
    
    return switch (T) {
      GetSeries => GetSeries(repository: repository)(NoParams()),
      _ => GetSeries(repository: repository)(NoParams()),
    };
  }
}
