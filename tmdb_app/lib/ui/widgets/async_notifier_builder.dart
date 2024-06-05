import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncNotifierBuilder<Notifier extends AsyncNotifier<State>, State>
    extends ConsumerWidget {
  final AsyncNotifierProvider<Notifier, State> notifierProvider;

  const AsyncNotifierBuilder({
    super.key,
    required this.notifierProvider,
    required this.builder,
  });

  final Widget Function(BuildContext context, State state) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(notifierProvider).when(
        data: (data) {
          return builder(context, data);
        },
        error: (err, stackTrace) => Center(child: Text(err.toString()),),
        loading: () => const CircularProgressIndicator());
  }
}
