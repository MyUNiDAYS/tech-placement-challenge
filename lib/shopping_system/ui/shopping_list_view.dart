import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_placement_challenge/shopping_system/basket.dart';
import 'package:tech_placement_challenge/shopping_system/discount.dart';
import 'package:tech_placement_challenge/shopping_system/item.dart';

List<Item> itemList = [
  Item('A', 8),
  Item('B', 12, DiscountNForPrice(2, 20)),
  Item('C', 4, DiscountNForPrice(3, 10)),
  Item('D', 7, DiscountBuyNGet1(1)),
  Item('E', 5, DiscountBuyNGet1(2)),
];

class ShoppingListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard(
          item: itemList[index],
          margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          padding: EdgeInsets.all(20.0),
          borderRadius: BorderRadius.circular(20.0),
        );
      },
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  const ItemCard({
    Key key,
    @required this.item,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.margin,
      child: Material(
        clipBehavior: Clip.hardEdge,
        elevation: 5.0,
        borderRadius: this.borderRadius,
        child: InkWell(
          onTap: () {
            Provider.of<Basket>(context, listen: false).addToBasket(item, 1);
          },
          child: Padding(
            padding: this.padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    this.item.name,
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
                Wrap(
                  spacing: 5.0,
                  direction: Axis.vertical,
                  children: <Widget>[
                    if (this.item.discount != null)
                      Text(
                        this.item.discount.description,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    Text(
                      '\$' + this.item.price.toString(),
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
