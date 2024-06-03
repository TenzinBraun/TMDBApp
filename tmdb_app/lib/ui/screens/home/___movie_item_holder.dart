import 'package:flutter/material.dart';
import 'package:tmdb_app/ui/screens/home/____favorite_widget_consumer.dart';

import '../../../domain/entities/movie.dart';

class MovieItemHolder extends StatelessWidget {
  const MovieItemHolder({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
              gaplessPlayback: true,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(movie.title)),
                      FavoriteWidgetConsumer(movie),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      movie.overview.length > 255
                          ? "${movie.overview.substring(0, 255)}... voir plus"
                          : movie.overview,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
