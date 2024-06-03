import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class MovieItemHolder extends StatelessWidget {
  const MovieItemHolder({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.title),
      subtitle: Text(movie.overview),
      leading: Image.network(
          'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
    );
  }
}
