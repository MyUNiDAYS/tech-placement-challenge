import 'package:tech_placement_challenge/shopping_system/item.dart';

/// An object which maintains items and information involved with the shopping
/// system.
class Basket {
  /// The price that must be surpassed in order for the delivery charge to not
  /// be applied.
  final double deliveryThreshold;

  /// The charge to apply if the [deliveryThreshold] is not surpassed.
  final double deliveryCharge;

  /// The list items in the basket paired with their count.
  Map<Item, int> itemList = new Map();

  Basket({this.deliveryCharge = 7.0, this.deliveryThreshold = 50.0});

  /// Adds an item to the basket
  ///
  /// Increments the [item] in [itemList] by [toAdd]. If [item] is not present
  /// in [itemList], it will be added with a starting count of [toAdd].
  void addToBasket(Item item, int toAdd) {
    itemList.update(item, (count) => count + toAdd, ifAbsent: () => toAdd);
  }

  /// Removes an item from the basket.
  ///
  /// Decrements the [item] in [itemList] by [toRemove]. If [item]'s new count
  /// is less than or equal to 0, it will be removed from the list.
  void removeFromBasket(Item item, int toRemove) {
    if (itemList.containsKey(item)) {
      itemList.update(item, (count) => count - toRemove);

      if (itemList[item] <= 0) {
        itemList.remove(item);
      }
    }
  }

  /// Clears the basket
  void clearBasket() {
    itemList.clear();
  }

  /// Calculated the price of the items in [itemList] after their discounts.
  double calculatePrice() {
    double price = 0;

    itemList.forEach((Item item, int count) {
      double itemTotalPrice;

      if (item.discount == null) {
        itemTotalPrice = item.price;
      } else {
        itemTotalPrice = item.discount.calculatePrice(item, count);
      }

      price += itemTotalPrice;
    });

    return price;
  }

  /// Calculates the price of delivery.
  ///
  /// If [price] is not provided, it will be calculated using
  /// [calculatePrice()].
  double calculateDelivery([double price]) {
    double deliveryPrice = 0;
    price ??= calculateTotalPrice();

    if (price > 0 && price < deliveryThreshold) {
      deliveryPrice = deliveryCharge;
    }

    return deliveryPrice;
  }

  /// Calculates the total price of the basket, including both the price of the
  /// discounted items and the delivery price.
  double calculateTotalPrice() {
    double price = calculatePrice();
    double delivery = calculateDelivery(price);

    return price + delivery;
  }
}
