import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncNotifierBuilder<Notifier extends AsyncNotifier<State>, State>
    extends ConsumerWidget {
  final AsyncNotifierProvider<Notifier, State> provider;

  const AsyncNotifierBuilder({
    super.key,
    required this.provider,
    required this.builder,
  });

  final Widget Function(BuildContext context, State state) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(provider).when(
        data: (data) {
          return builder(context, data);
        },
        error: (err, stackTrace) => Center(child: Text(err.toString()),),
        loading: () => const CircularProgressIndicator());
  }
}
