import 'package:flutter/material.dart';
import '../../widgets/stock_table.dart';
import '../../practice/AppBarBottomWidget.dart';
import '../../practice/Navigation.dart';

const List<Map<String, String>> sampleItemList = [
  {'symbol': 'sh600000', 'name': '浦发银行', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh600178', 'name': '东安动力', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh600748', 'name': '上实发展', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh000001', 'name': '上证指数', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh300333', 'name': '兆日科技', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh300354', 'name': '东华测试', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh300096', 'name': '易联众', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh600478', 'name': '科力远', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh603017', 'name': '中衡设计', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh300274', 'name': '阳光电源', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh600841', 'name': '上柴股份', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh600280', 'name': '中央商场', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh300302', 'name': '同有科技', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh002079', 'name': '苏州固锝', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh600460', 'name': '士兰微', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh603220', 'name': '贝通信', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
  {'symbol': 'sh300613', 'name': '富瀚微', 'price': '5.55', 'high': '6.66', 'low': '4.44', 'vol': '7.77万'},
];

const Map<String, String> sampleHeaderMap = {
  'symbol': '代码',
  'name': '名称',
  'price': '现价',
  'high': '最高',
  'low': '最低',
  'vol': '成交量',
};

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

// TabController + TabBar + TabBarView
class _MarketPageState extends State<MarketPage>
    with AutomaticKeepAliveClientMixin {
  final List<String> _allTabs = ['沪深', '港股', '美股'];
  final List<Widget> _allPages = [
    StockTableView(
      delegate: ItemListStockTableDelegate(
        data: sampleItemList,
        primaryKey: "symbol",
        headerMap: sampleHeaderMap,
      ),
    ),
    Navigation(),
    AppBarBottom()
  ];

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
              preferredSize: Size.fromHeight(48.0)),
          body: new TabBarView(
              children: _allTabs.map((name) {
            return _allPages[_allTabs.indexOf(name)];
          }).toList()),
        ));
  }
}
