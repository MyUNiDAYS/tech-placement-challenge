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

  /// Returns the price of a given amount of items with its discount being
  /// taken into consideration
  ///
  /// @param count The amount of items being used to determine the price
  double calculatePrice(int count) {
    double itemTotalPrice;

    if (discount == null) {
      itemTotalPrice = price * count;
    } else {
      itemTotalPrice = discount.calculatePrice(this, count);
    }

    return itemTotalPrice;
  }
}
