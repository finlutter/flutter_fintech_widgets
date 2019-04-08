import 'package:flutter/material.dart';
import '../widgets/stock_view.dart';

class SimpleListView extends StatelessWidget {
  final List<Map> items = [
    {'symbol': 'sh600000', 'name': '浦发银行'},
    {'symbol': 'sh600178', 'name': '东安动力'},
    {'symbol': 'sh600178', 'name': '东安动力'},
    {'symbol': 'sh600748', 'name': '上实发展'},
    {'symbol': 'sh000001', 'name': '上证指数'},
    {'symbol': 'sh300333', 'name': '兆日科技'},
    {'symbol': 'sh300354', 'name': '东华测试'},
    {'symbol': 'sh300096', 'name': '易联众'},
    {'symbol': 'sh600478', 'name': '科力远'},
    {'symbol': 'sh603017', 'name': '中衡设计'},
    {'symbol': 'sh300274', 'name': '阳光电源'},
    {'symbol': 'sh600841', 'name': '上柴股份'},
    {'symbol': 'sh600280', 'name': '中央商场'},
    {'symbol': 'sh300302', 'name': '同有科技'},
    {'symbol': 'sh002079', 'name': '苏州固锝'},
    {'symbol': 'sh600460', 'name': '士兰微'},
    {'symbol': 'sh603220', 'name': '贝通信'},
    {'symbol': 'sh300613', 'name': '富瀚微'},
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text("${items[index]['name']}"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StockViewPage("${items[index]['symbol']}")));
              },
            );
          }),
    );
  }
}
