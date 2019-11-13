import 'package:tech_placement_challenge/shopping_system/item.dart';

/// Abstract implementation of a discount object.
///
/// Adheres to the strategy pattern. Each implementation of [Discount] must
/// override [calculatePrice()].
abstract class Discount {
  /// Description of the discount.
  ///
  /// ```
  /// description = "8 Items For The $6.00"
  /// ```
  final String description;

  const Discount({this.description});

  /// Calculates the discounted price of an item.
  ///
  /// @param item The item to discount.
  /// @param count The amount of items present.
  /// @returns The discounted price.
  double calculatePrice(Item item, int count);
}

/// Predefined implementation of a discount.
///
/// Applicable for when the discount is of the format:
///   "[n] for $[discountPrice]"
///   "8 for $6.00"
class DiscountNForPrice extends Discount {
  /// The amount of items required for the discounted price to be applied.
  final int n;

  /// The discounted price to be applied if [n] items are present.
  final double discountPrice;

  const DiscountNForPrice(
    this.n,
    this.discountPrice,
  ) : super(description: '$n For \$$discountPrice');

  /// Calculates the discounted price by doing the following:
  ///   - Determine the amount of pairs of [n] items there are present.
  ///       I cheated a little bit here by determining the amount of items within
  ///       the pairs in order to avoid an unnecessary casting.
  ///   - Calculate the price of the non-discounted items by multiplying the
  ///     [amountNormal] by the items normal price.
  ///   - Calculate the price of the discounted items by multiplying the
  ///     [amountDiscounted] by the [discountPrice].
  ///   - Return the sum of the discounted and non-discounted prices.
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

/// Predefined implementation of a discount.
///
/// Applicable for when the discount is of the format:
///   "Buy [n] get 1 free"
///   "Buy 3 get 1 free"
///
/// In order to follow the rules of the UNiDAYS coding challenge, an additional
/// item is not given if [n] item are purchased. Rather, if an additional item
/// is purchased after [n] items are purchased, the additional item is free of
/// charge.
///
/// Additionally, "3 for the price of 2" is also of this format. It can be
/// described in other words as "Buy 2 get 1 free".
class DiscountBuyNGet1 extends Discount {
  /// The amount of items required to obtain an additional free item
  final int n;

  DiscountBuyNGet1(this.n) : super(description: 'Buy $n Get 1 Free');

  /// Calculates the discounted price by doing the following:
  ///   - Determine the amount of pairs of [n] + 1 items there are present.
  ///       The reason it is [n] + 1 is because the discount is not applied
  ///       until an additional item is added to the basket.
  ///   - Calculate the price of the discounted items by multiplying the
  ///   items normal price by the total [count] of items subtracted by the
  ///   [freeItemCount].
  @override
  double calculatePrice(Item item, int count) {
    int freeItemCount = (count / (n + 1)).floor();

    double totalPrice = item.price * (count - freeItemCount);

    return totalPrice;
  }
}
