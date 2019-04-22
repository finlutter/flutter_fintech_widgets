import 'package:flutter/material.dart';
import '../widgets/stock_table.dart';
import '../widgets/stock_view.dart';

const List<Map<String, String>> sampleItemList = [
  {
    'symbol': 'sh600000',
    'name': '浦发银行',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh600178',
    'name': '东安动力',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh600748',
    'name': '上实发展',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh000001',
    'name': '上证指数',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh300333',
    'name': '兆日科技',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh300354',
    'name': '东华测试',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh300096',
    'name': '易联众',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh600478',
    'name': '科力远',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh603017',
    'name': '中衡设计',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh300274',
    'name': '阳光电源',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh600841',
    'name': '上柴股份',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh600280',
    'name': '中央商场',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh300302',
    'name': '同有科技',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh002079',
    'name': '苏州固锝',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh600460',
    'name': '士兰微',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh603220',
    'name': '贝通信',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
  {
    'symbol': 'sh300613',
    'name': '富瀚微',
    'price': '5.55',
    'high': '6.66',
    'low': '4.44',
    'vol': '7.77万'
  },
];

const Map<String, String> sampleHeaderMap = {
  'symbol': '代码',
  'name': '名称',
  'price': '现价',
  'high': '最高',
  'low': '最低',
  'vol': '成交量',
};

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StockTableView(
        delegate: ItemListStockTableDelegate(
          data: sampleItemList,
          primaryKey: "symbol",
          headerMap: sampleHeaderMap,
          onTap: (context, row) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StockViewPage("${sampleItemList[row]['symbol']}"),
              ),
            );
          },
        ),
      ),
    );
  }

}