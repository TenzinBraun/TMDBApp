part of 'detail_screen.dart';

class DetailMovieConsumer extends ConsumerWidget {
  const DetailMovieConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: true,
      onPopInvoked: (hasPop) async {
          ref.read(movieProvider.notifier).popBack();
        },
      child: AsyncNotifierBuilder(
          provider: movieProvider,
          builder: (context, state) {
            if (state is ShowDetailState) {
              return DetailMovieItemHolder(movie: state.movie);
            }
            return const SizedBox();
          }),
    );
  }
}
