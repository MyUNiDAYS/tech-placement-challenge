import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tech_placement_challenge/shopping_system/basket.dart';

import './bloc.dart';

class ShoppingListBloc extends Bloc<ShoppingListEvent, Basket> {
  @override
  Basket get initialState => Basket();

  @override
  Stream<Basket> mapEventToState(
    ShoppingListEvent event,
  ) async* {
    if (event is AddItem) {
      state.addToBasket(event.item, event.count);
    } else if (event is RemoveItem) {
      state.removeFromBasket(event.item, event.count);
    } else if (event is ClearBasket) {
      state.clearBasket();
    }
  }
}
