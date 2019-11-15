import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_placement_challenge/shopping_system/basket.dart';
import 'package:tech_placement_challenge/shopping_system/ui/basket_list_item.dart';

import '../item.dart';

class BasketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Basket>(
      builder: (_, basket, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                CustomTextListTile(
                  leadingText: 'Order'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Divider(
                  thickness: 0.6,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: basket.itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Item item = basket.itemList.keys.elementAt(index);
                    int count = basket.itemList[item];
                    return BasketListItem(
                      item: item,
                      count: count,
                    );
                  },
                ),
                CustomTextListTile(
                    leadingText: 'Subtotal',
                    trailingText: '\$' + basket.calculatePrice().toString(),
                    padding:
                        EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
                    style: Theme.of(context).textTheme.subhead),
                CustomTextListTile(
                  leadingText: 'Delivery',
                  trailingText: '\$' + basket.calculateDelivery().toString(),
                  style: Theme.of(context).textTheme.subhead,
                ),
                CustomTextListTile(
                  leadingText: 'Total',
                  trailingText: '\$' + basket.calculateTotalPrice().toString(),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final EdgeInsets padding;

  CustomListTile({
    Key key,
    this.leading,
    this.trailing,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding ?? EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (leading != null) leading,
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}

class CustomTextListTile extends CustomListTile {
  CustomTextListTile({
    Key key,
    String leadingText,
    String trailingText,
    EdgeInsets padding,
    TextStyle style,
  }) : super(
          key: key,
          leading: leadingText != null
              ? Text(
                  leadingText,
                  style: style,
                )
              : null,
          trailing: trailingText != null
              ? Text(
                  trailingText,
                  style: style,
                )
              : null,
          padding: padding,
        );
}
