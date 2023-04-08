import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/layout/default_layout.dart';
import 'package:riverpod_example/model/shopping_item_model.dart';
import 'package:riverpod_example/riverpod/state_notfier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);

    return DefaultLayout(
        title: 'StateNotifierProvider',
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
