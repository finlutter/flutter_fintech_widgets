import 'package:flutter/material.dart';
import '../../practice/SimpleList.dart';
import '../../practice/AppBarBottomWidget.dart';
import '../../practice/Navigation.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

// TabController + TabBar + TabBarView
class _MarketPageState extends State<MarketPage>
    with AutomaticKeepAliveClientMixin {

  final List<String> _allTabs  = ['沪深', '港股', '美股'];
  final List<Widget> _allPages = [SimpleListView(), Navigation(), AppBarBottom()];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: _allTabs.length,
        child: new Scaffold(
          appBar: PreferredSize(
              child: new AppBar(
                leading: new IconButton(
                    icon: new Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    tooltip: 'Navigation Menu',
                    onPressed: null),
                actions: <Widget>[
                  new IconButton(
                      icon: new Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      tooltip: 'Search',
                      onPressed: null)
                ],
                centerTitle: true,
                title: new TabBar(
                  isScrollable: true,
                  labelPadding: EdgeInsets.all(12.0),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: _allTabs.map((name) => new Tab(text: name)).toList(),
                ),
              ),
              preferredSize: Size.fromHeight(48.0)
          ),
          body: new TabBarView(
              children: _allTabs.map((name) {
                return _allPages[_allTabs.indexOf(name)];
              }).toList()),
        )
    );
  }
}