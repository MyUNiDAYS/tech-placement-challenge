import 'package:tech_placement_challenge/shopping_system/discount.dart';

/// A simple data structure which holds information about an item that is
/// involved with the shopping system
class Item {
  /// The name of the item
  final String name;

  /// The base price of the item
  final double price;

  /// The discount (if any) that is eligible for this item
  final Discount discount;

  Item(this.name, this.price, [this.discount]);
}
