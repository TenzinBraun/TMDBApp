import 'package:flutter/material.dart';
import 'package:tmdb_app/ui/screens/home/___movie_item_holder.dart';

import '../../../domain/entities/movie.dart';

class LoadedMovies extends StatelessWidget {
  const LoadedMovies({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => MovieItemHolder(movie: movies[index]),
            childCount: movies.length,
          ),
        ),
      ],
    );
  }
}
