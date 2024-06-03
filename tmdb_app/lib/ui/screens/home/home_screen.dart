import 'package:flutter/material.dart';
import 'package:tmdb_app/ui/screens/home/_movies_consumer_widget.dart';

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
    );
  }
}
