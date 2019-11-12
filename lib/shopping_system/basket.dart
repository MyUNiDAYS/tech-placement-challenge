import 'package:tech_placement_challenge/shopping_system/item.dart';

class Basket {
  Map<Item, int> itemList = new Map();

  Basket();

  void addItem(Item item, int toAdd) {
    itemList.update(item, (count) => count + toAdd, ifAbsent: () => toAdd);
  }

  void removeItem(Item item, int toRemove) {
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

  double calculateTotalPrice() {
    double totalPrice = 0;

    itemList.forEach((Item item, int count) {
      double itemTotalPrice;

      if (item.discount == null) {
        itemTotalPrice = item.price;
      } else {
        itemTotalPrice = item.discount.calculatePrice(item, count);
      }

      totalPrice += itemTotalPrice;
    });

    return totalPrice;
  }
}
