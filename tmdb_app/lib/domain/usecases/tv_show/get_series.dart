import 'package:tmdb_app/domain/repositories/tv_show/tv_show_repository.dart';
import 'package:tmdb_app/domain/usecases/use_case.dart';

import '../../entities/movie.dart';

class GetSeries implements UseCase<List<Movie>, NoParams> {
  final TvShowRepository repository;

  GetSeries({required this.repository});

  @override
  Future<List<Movie>> call(NoParams params) async {
    return await repository.getListOfModel();
  }
}
