import 'package:flutter/material.dart';
import 'package:tmdb_app/ui/widgets/bottom_app_bar_widget.dart';

import '_favorite_movie_consumer.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: FavoriteMovieConsumer()),
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
