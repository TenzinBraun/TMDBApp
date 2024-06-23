part of 'detail_screen.dart';

class DetailMovieConsumer extends ConsumerWidget {
  const DetailMovieConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: true,
      onPopInvoked: (hasPop) async {
        ref.read(movieNotifierProvider.notifier).popBack();
      },
      child: AsyncNotifierBuilder(
        provider: movieNotifierProvider,
        builder: (context, state) {
          if (state is ShowDetailState) {
            return DetailMovieItemHolder(movie: state.movie);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
