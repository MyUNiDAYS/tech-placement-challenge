import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_placement_challenge/shopping_system/basket.dart';
import 'package:tech_placement_challenge/shopping_system/ui/basket_view.dart';

import '../item.dart';

class BasketListItem extends StatelessWidget {
  final Item item;
  final int count;

  const BasketListItem({
    Key key,
    @required this.item,
    @required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) =>
          Provider.of<Basket>(context, listen: false).clearItemFromBasket(item),
      child: Column(
        children: <Widget>[
          CustomListTile(
            leading: Text(
              item.name,
              style: Theme.of(context).textTheme.subhead,
            ),
            trailing: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.grey.shade700,
                    onPressed: () => Provider.of<Basket>(context, listen: false)
                        .addToBasket(item, 1),
                  ),
                  Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    color: Colors.grey.shade700,
                    onPressed: () => Provider.of<Basket>(context, listen: false)
                        .removeFromBasket(item, 1),
                  ),
                  Container(
                    width: 80.0,
                    alignment: Alignment.centerRight,
                    child: Text(
                      '\$' + item.calculatePrice(count).toString(),
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 0.6,
          ),
        ],
      ),
    );
  }
}
