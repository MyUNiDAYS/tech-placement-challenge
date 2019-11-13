import 'package:meta/meta.dart';
import 'package:tech_placement_challenge/shopping_system/item.dart';

@immutable
abstract class ShoppingListEvent {}

class AddItem extends ShoppingListEvent {
  final Item item;
  final int count;

  AddItem({
    @required this.item,
    @required this.count,
  });
}

class RemoveItem extends ShoppingListEvent {
  final Item item;
  final int count;

  RemoveItem({
    @required this.item,
    @required this.count,
  });
}

class ClearBasket extends ShoppingListEvent {}
