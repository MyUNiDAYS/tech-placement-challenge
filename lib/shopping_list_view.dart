import 'package:flutter/material.dart';
import 'package:tech_placement_challenge/shopping_system/basket.dart';
import 'package:tech_placement_challenge/shopping_system/discount.dart';
import 'package:tech_placement_challenge/shopping_system/item.dart';

import 'basket_view.dart';

List<Item> itemList = [
  Item('A', 8),
  Item('B', 12, DiscountNForPrice(2, 20)),
  Item('C', 4, DiscountNForPrice(3, 10)),
  Item('D', 7, DiscountBuyNGetN(1, 1)),
  Item('E', 5, DiscountBuyNGetN(2, 1)),
];

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Basket basket;

  @override
  void initState() {
    super.initState();

    basket = Basket();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  setState(() {
                    this.basket.addItem(itemList[index], 1);
                  });
                },
                onLongPress: () {
                  setState(() {
                    this.basket.removeItem(itemList[index], 1);
                  });
                },
                title: Text(itemList[index].name),
                trailing: Text(itemList[index].price.toString()),
              ),
            );
          },
        ),
        BasketView(
          basket: this.basket,
        ),
      ],
    );
  }
}
