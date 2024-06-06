import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/http/app_client.dart';
import '../../../config/navigation/app_routing.dart';
import '../../../domain/entities/movie.dart';
import '../../providers/shared/shared_provider.dart';
import '../../widgets/async_notifier_builder.dart';
import '../../widgets/bottom_app_bar_widget.dart';
import '../tv_show/tv_show_screen.dart';

part '____favorite_widget_consumer.dart';

part '___movie_item_holder.dart';

part '__loaded_movies.dart';

part '_movies_consumer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: controller,
              tabs: const [
                Tab(
                  text: "Films",
                ),
                Tab(
                  text: "Séries",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: const [
                  MoviesConsumerWidget(),
                  TvShowConsumerWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
