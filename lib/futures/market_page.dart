import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPage createState() => _MarketPage();
}

// TabController + TabBar + TabBarView
class _MarketPage extends State<MarketPage> with AutomaticKeepAliveClientMixin {
  final List<String> tabs = [
    '国内',
    '国际',
    '股票',
  ];
  final List<Widget> views = [
    Container(),
    Container(),
    Container(),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  tooltip: 'Navigation Menu',
                  onPressed: null),
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    tooltip: 'Search',
                    onPressed: null),
                IconButton(
                    icon: Icon(
                      Icons.more,
                      color: Colors.white,
                    ),
                    tooltip: 'More',
                    onPressed: null)
              ],
              centerTitle: true,
              title: TabBar(
                isScrollable: true,
                labelPadding: EdgeInsets.all(12.0),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: tabs.map((name) => Tab(text: name)).toList(),
              ),
            ),
            preferredSize: Size.fromHeight(48.0)),
        body: TabBarView(
            children: tabs.map((name) {
          return views[tabs.indexOf(name)];
        }).toList()),
      ),
    );
  }
}
