import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/http/app_client.dart';
import '../../../config/navigation/app_routing.dart';
import '../../../domain/entities/movie.dart';
import '../../providers/movie/movie_notifier.dart';
import '../../providers/movie/movie_provider.dart';
import '../../widgets/async_notifier_builder.dart';
import '../../widgets/bottom_app_bar_widget.dart';

part '____favorite_widget_consumer.dart';

part '___movie_item_holder.dart';

part '__loaded_movies.dart';

part '_movies_consumer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MoviesConsumerWidget(),
      ),
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
