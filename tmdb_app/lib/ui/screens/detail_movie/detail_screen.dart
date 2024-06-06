import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/http/app_client.dart';
import '../../../domain/entities/movie.dart';
import '../../providers/movie/movie_notifier.dart';
import '../../providers/movie/movie_provider.dart';
import '../../widgets/async_notifier_builder.dart';

part '__detail_movie_item_holder.dart';

part '_detail_movie_consumer.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: DetailMovieConsumer(),
      ),
    );
  }
}
