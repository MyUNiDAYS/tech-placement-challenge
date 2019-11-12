import 'package:tech_placement_challenge/shopping_system/discount.dart';

class Item {
  final String name;
  final double price;
  final Discount discount;

  Item(this.name, this.price, [this.discount]);
}
