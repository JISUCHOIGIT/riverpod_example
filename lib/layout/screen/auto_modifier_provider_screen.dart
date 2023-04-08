import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/layout/default_layout.dart';
import 'package:riverpod_example/riverpod/auto_dispose_modifier_provider.dart';

class AutoModifierScreen extends ConsumerWidget {
  const AutoModifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeProvider);

    return DefaultLayout(
        title: 'AutoModifierScreen',
        body: Center(
          child: state.when(
            data: (data) => Text(data.toString()),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => CircularProgressIndicator(),
          ),
        ));
  }
}
