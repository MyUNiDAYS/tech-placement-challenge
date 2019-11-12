import 'package:flutter/material.dart';
import 'package:tech_placement_challenge/shopping_system/basket.dart';
import 'package:tech_placement_challenge/shopping_system/item.dart';

class BasketView extends StatefulWidget {
  final Basket basket;

  const BasketView({
    Key key,
    this.basket,
  }) : super(key: key);

  @override
  _BasketViewState createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.basket.itemList.length,
          itemBuilder: (BuildContext context, int index) {
            Item item = widget.basket.itemList.keys.elementAt(index);
            int count = widget.basket.itemList[item];

            return Card(
              child: ListTile(
                leading: Text(item.name),
                trailing: Text(count.toString()),
              ),
            );
          },
        ),
        Card(
          child: ListTile(
            leading: Text(widget.basket.calculateTotalPrice().toString()),
          ),
        ),
      ],
    );
  }
}
