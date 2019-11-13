import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_placement_challenge/shopping_system/basket.dart';
import 'package:tech_placement_challenge/shopping_system/bloc/shopping_list_bloc.dart';
import 'package:tech_placement_challenge/shopping_system/item.dart';

class BasketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListBloc, Basket>(
      builder: (context, basket) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                CustomListTile(
                  leading: 'Order'.toUpperCase(),
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

                    return Column(
                      children: <Widget>[
                        CustomListTile(
                          leading: item.name,
                          trailing: count.toString(),
                        ),
                        Divider(
                          thickness: 0.6,
                        ),
                      ],
                    );
                  },
                ),
                CustomListTile(
                  leading: 'Subtotal',
                  trailing: '\$' + basket.calculatePrice().toString(),
                  padding: EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
                ),
                CustomListTile(
                  leading: 'Delivery',
                  trailing: '\$' + basket.calculateDelivery().toString(),
                ),
                CustomListTile(
                  leading: 'Total',
                  trailing: '\$' + basket.calculateTotalPrice().toString(),
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
  final String leading;
  final String trailing;
  final EdgeInsets padding;
  final TextStyle style;

  const CustomListTile({
    Key key,
    this.leading,
    this.trailing,
    this.padding,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding ?? EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (leading != null)
            Text(
              leading,
              style: this.style ?? Theme.of(context).textTheme.subhead,
            ),
          if (trailing != null)
            Text(
              trailing,
              style: this.style ?? Theme.of(context).textTheme.subhead,
            ),
        ],
      ),
    );
  }
}
