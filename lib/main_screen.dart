import 'package:flutter/material.dart';

import './main/pages/main_home_page.dart';
import './main/pages/main_market_page.dart';
import './main/pages/main_news_page.dart';
import './main/pages/main_mine_page.dart';
import 'futures/market_page.dart' as futures;

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: move MaterialApp outside
    return MaterialApp(
      title: 'Flutter Fintech Widgets',
      home: MainNavigation(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _Item {
  const _Item({this.name, this.icon, this.builder});
  final String name;
  final IconData icon;
  final WidgetBuilder builder;
}

class _MainNavigationState extends State<MainNavigation>
    with SingleTickerProviderStateMixin {
  final List<_Item> pages = <_Item>[
    _Item(
        name: '首页',
        icon: Icons.home,
        builder: (BuildContext context) => HomePage()),
    _Item(
        name: '期货行情',
        icon: Icons.money_off,
        builder: (BuildContext context) => futures.MarketPage()),
    _Item(
        name: '股票行情',
        icon: Icons.favorite,
        builder: (BuildContext context) => MarketPage()),
    _Item(
        name: '资讯',
        icon: Icons.info,
        builder: (BuildContext context) => NewsPage()),
    _Item(
        name: '我的',
        icon: Icons.settings,
        builder: (BuildContext context) => MinePage()),
  ];

  int currentIndex = 0;
  var controller = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int index) =>
            pages[index].builder(context),
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            controller.jumpToPage(index);
            setState(() {
              currentIndex = index;
            });
          },
          iconSize: 22,
          fixedColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          items: pages.map((item) {
            return _buildItem(item);
          }).toList()),
    );
  }

  BottomNavigationBarItem _buildItem(_Item item) {
    return BottomNavigationBarItem(
      icon: Icon(item.icon),
      title: Text(item.name),
    );
  }
}
