import 'package:tech_placement_challenge/shopping_system/item.dart';

abstract class Discount {
  final String description;

  const Discount({this.description});

  double calculatePrice(Item item, int count);
}

class DiscountNForPrice extends Discount {
  final int n;
  final double discountPrice;

  const DiscountNForPrice(
    this.n,
    this.discountPrice,
  ) : super(description: '$n For \$$discountPrice');

  @override
  double calculatePrice(Item item, int count) {
    int amountNormal = count % n;
    int amountDiscounted = count - amountNormal;

    double totalDiscounted = amountDiscounted * discountPrice / n;
    double totalNormal = amountNormal * item.price;
    double totalPrice = totalDiscounted + totalNormal;

    return totalPrice;
  }
}

class DiscountBuyNGetN extends Discount {
  final int buyN;
  final int getN;

  DiscountBuyNGetN(this.buyN, this.getN)
      : super(description: 'Buy $buyN Get $getN Free');

  @override
  double calculatePrice(Item item, int count) {
    int freeItemCount = (count / (buyN + 1)).floor();

    double totalPrice = item.price * (count - freeItemCount);

    return totalPrice;
  }
}
