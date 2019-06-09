import 'package:flutter/material.dart';
import '../../widgets/tabbed_scaffold.dart';
import '../../market/favorite_page.dart';
import '../../market/market_page.dart';

class MainMarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabbedScaffold(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 32.0,
        ),
        tooltip: 'Navigation Menu',
        onPressed: () {
          debugPrint("Menu button pressed");
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: 32.0,
          ),
          tooltip: 'Search',
          onPressed: () {
            debugPrint("search button pressed");
          },
        ),
      ],
      children: <Widget>[
        FavoritePage(),
        MarketPage(),
      ],
      labels: [
        "自选",
        "市场",
      ],
    );
  }
}
