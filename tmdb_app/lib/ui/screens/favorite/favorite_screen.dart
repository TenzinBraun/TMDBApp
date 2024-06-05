import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/movie_provider.dart';
import '../../widgets/bottom_app_bar_widget.dart';
import '../home/home_screen.dart';

part '_favorite_movie_consumer.dart';

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
