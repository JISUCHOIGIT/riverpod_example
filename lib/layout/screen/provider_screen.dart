import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/layout/default_layout.dart';
import 'package:riverpod_example/riverpod/proivder.dart';

import '../../riverpod/state_notfier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingList);
    print(state);

    return DefaultLayout(
        title: 'ProviderScreen',
        actions: [
          PopupMenuButton<FilterState>(
            itemBuilder: (context) => FilterState.values
                .map((e) => PopupMenuItem(
                      child: Text(e.name),
                      value: e,
                    ))
                .toList(),
            onSelected: (value) {
              ref.read(filterProvider.notifier).update((state) => value);
            },
          )
        ],
        body: ListView(
          children: state
              .map(
                (e) => CheckboxListTile(
                  value: e.hasBought,
                  // 눌릴때마다 체크 값을 가져옴
                  onChanged: (value) {
                    ref.read(shoppingListProvider.notifier).toggleHasBought(
                          name: e.name,
                        );
                  },
                  title: Text(e.name),
                ),
              )
              .toList(),
        ));
  }
}
