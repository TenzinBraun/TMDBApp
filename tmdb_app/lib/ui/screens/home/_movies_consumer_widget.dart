import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/movie_provider.dart';
import '___movie_item_holder.dart';

class MoviesConsumerWidget extends ConsumerWidget {
  const MoviesConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var movies = ref.watch(movieListProvider);
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
