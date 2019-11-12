import 'package:flutter/material.dart';
import 'package:tech_placement_challenge/shopping_list_view.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ShoppingList(),
      ),
    );
  }
}
