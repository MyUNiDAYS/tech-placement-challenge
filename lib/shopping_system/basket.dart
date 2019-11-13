import 'package:tech_placement_challenge/shopping_system/item.dart';

class Basket {
  final double deliveryCharge;
  final double deliveryThreshold;
  Map<Item, int> itemList = new Map();

  Basket({this.deliveryCharge = 7.0, this.deliveryThreshold = 50.0});

  void addToBasket(Item item, int toAdd) {
    itemList.update(item, (count) => count + toAdd, ifAbsent: () => toAdd);
  }

  void removeFromBasket(Item item, int toRemove) {
    if (itemList.containsKey(item)) {
      if (itemList[item] <= 1) {
        itemList.remove(item);
      } else {
        itemList.update(item, (count) => count - toRemove);
      }
    }
  }

  void clearBasket() {
    itemList.clear();
  }

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

  double calculateDelivery([double price]) {
    double deliveryPrice = 0;
    price ??= calculateTotalPrice();

    if (price > 0 && price < deliveryThreshold) {
      deliveryPrice = deliveryCharge;
    }

    return deliveryPrice;
  }

  double calculateTotalPrice() {
    double price = calculatePrice();
    double delivery = calculateDelivery(price);

    return price + delivery;
  }
}
