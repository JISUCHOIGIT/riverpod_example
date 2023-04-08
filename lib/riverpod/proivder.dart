import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/model/shopping_item_model.dart';
import 'package:riverpod_example/riverpod/state_notfier_provider.dart';

final filteredShoppingList = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where((element) => filterState == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();
  },
);

enum FilterState {
  //안매움
  notSpicy,
  //매움
  spicy,
  //모두
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
