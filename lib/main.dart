import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tech_placement_challenge/shopping_system/basket.dart';
import 'package:tech_placement_challenge/shopping_system/theme/theme.dart';
import 'package:tech_placement_challenge/shopping_system/ui/basket_view.dart';
import 'package:tech_placement_challenge/shopping_system/ui/shopping_list_view.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return ChangeNotifierProvider<Basket>(
      builder: (context) => Basket(),
      child: MaterialApp(
        theme: lightTheme,
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
  }

  void _pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body: _views[_currentIndex],
      body: PageView(
        controller: this.pageController,
        onPageChanged: _pageChanged,
        children: <Widget>[
          ShoppingListView(),
          BasketView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Shop'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
        ],
      ),
    );
  }
}
