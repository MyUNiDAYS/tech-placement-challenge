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
                          leading: Text(item.name),
                          trailing: Text(count.toString()),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    );
                  },
                ),
                CustomListTile(
                  leading: Text('Subtotal'),
                  trailing: Text(
                    basket.calculatePrice().toString(),
                  ),
                  padding: EdgeInsets.only(
                      top: 20.0, left: 16.0, right: 16.0, bottom: 10.0),
                ),
                CustomListTile(
                  leading: Text('Delivery'),
                  trailing: Text(
                    basket.calculateDelivery().toString(),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                ),
                CustomListTile(
                  leading: Text('Total'),
                  trailing: Text(
                    basket.calculateTotalPrice().toString(),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
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

  const CustomListTile({
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
