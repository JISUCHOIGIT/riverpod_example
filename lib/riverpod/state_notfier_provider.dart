import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
      // 관리할 provider 인스턴스화
        (ref) => ShoppingListNotifier());

// 1. StateNotifierProvider = class 생성
// 2. extends StateNotifier<List<관련된 모델>>
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // 3. 생성자 생성 / ShoppingListProvider : super 초기화 값
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '수박',
              quantity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '카스테라',
              quantity: 5,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        );

  void toggleHasBought({required String name}) {
    // 현재 값을 불러오기 = state
    // map : 새로운 값 반환
    state = state
        .map((e) => e.name == name
            // e.name == name과 같다면 hasBought 값 변경
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            // 아닐 경우 똑같은 값 넣기
            : e)
        .toList();
  }
}
