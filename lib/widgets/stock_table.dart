import 'package:flutter/material.dart';

abstract class StockTableDeletgate {
  const StockTableDeletgate();

  int get numColumns;
  int get numRows;
  
  Widget createHeaderCell(int columnIndex, StockTableView tableView);
  Widget createCell(int rowIndex, int columnIndex, StockTableView tableView);
}

class DummyStockTableDelegate extends StockTableDeletgate {
  final int numColumns;
  final int numRows;

  const DummyStockTableDelegate({
    this.numColumns = 6,
    this.numRows = 40
  });

  @override
  Widget createCell(
    int rowIndex,
    int columnIndex,
    StockTableView tableView
  ) {
    assert(tableView != null);
    assert(rowIndex >= 0);
    assert(columnIndex >= 0);

    return Container(
      height: tableView.metrics.itemHeight,
      width: tableView.metrics.itemWidth,
      alignment: Alignment.center,
      color: rowIndex.isEven ? Colors.blueGrey[200] : Colors.white,
      child: Text('$rowIndex : $columnIndex'),
    );
  }

  @override
  Widget createHeaderCell(
    int columnIndex,
    StockTableView tableView
  ) {
    assert(tableView != null);
    assert(columnIndex >= 0);
    return Container(
      height: tableView.metrics.itemHeight,
      width: tableView.metrics.itemWidth,
      alignment: Alignment.center,
      color: Colors.green[100 * (columnIndex % 9)],
      child: Text('Column $columnIndex'),
    );
  }
}

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

class ItemListStockTableDelegate extends StockTableDeletgate {
  final List<String> _headerNames = List<String>();
  final List<String> _headerKeys = List<String>();
  final List<List<String>> _rows = List<List<String>>();

  ItemListStockTableDelegate(
    List<Map<String, String>> data,
    String primaryKey,
    Map<String, String> headerMap
  ):
  assert(data != null),
  assert(primaryKey != null),
  assert(headerMap != null)
  {
    _headerNames[0] = headerMap[primaryKey];
    _headerKeys[0] = primaryKey;
    headerMap.forEach((k, v) {
      if (k != primaryKey) {
        _headerKeys.add(k);
        _headerNames.add(v);
      }
    });

    data.forEach((item) {
      List<String> itemValues = List<String>();
      item.forEach((k, v) {
        int keyIndex = _headerKeys.indexOf(k);
        if (keyIndex >= 0) {
          itemValues[keyIndex] = v;
        }
      });
      _rows.add(itemValues);
    });
  }

  @override
  Widget createCell(
    int rowIndex,
    int columnIndex,
    StockTableView tableView)
  {
    assert(tableView != null);
    assert(rowIndex >= 0);
    assert(columnIndex >= 0);

    String cellText = "--";
    if (rowIndex >= 0 && rowIndex < _rows.length) {
      List<String> row = _rows[rowIndex];
      if (row != null && columnIndex >= 0 && columnIndex < row.length) {
        cellText = row[columnIndex];
      }
    }

    return Container(
      height: tableView.metrics.itemHeight,
      width: tableView.metrics.itemWidth,
      alignment: Alignment.center,
      color: rowIndex.isEven ? Colors.blueGrey[200] : Colors.white,
      child: Text(cellText),
    );
  }

  @override
  Widget createHeaderCell(
    int columnIndex,
    StockTableView tableView
  ) {
    assert(tableView != null);
    assert(columnIndex >= 0);

    String headerText = "--";
    if (columnIndex >= 0 && columnIndex < _headerNames.length) {
      if (_headerNames[columnIndex] != null) {
        headerText = _headerNames[columnIndex];
      } else if (_headerKeys[columnIndex] != null) {
        headerText = _headerKeys[columnIndex];
      }
    }

    return Container(
      height: tableView.metrics.itemHeight,
      width: tableView.metrics.itemWidth,
      alignment: Alignment.center,
      color: Colors.green[100 * (columnIndex % 9)],
      child: Text(headerText),
    );
  }

  @override
  int get numColumns => _headerNames.length;

  @override
  int get numRows => _rows.length;

}

class StockTableMetrics {
  static const double defaultHeaderHeight = 48.0;
  static const double defaultHeaderWidth = 146.0;
  static const double defaultItemHeight = 48.0;
  static const double defaultItemWidth = 146.0;

  final double headerHeight;
  final double primaryHeaderWidth;
  final double headerWidth;
  final double itemHeight;
  final double primaryItemWidth;
  final double itemWidth;

  const StockTableMetrics({
    this.headerHeight = defaultHeaderHeight,
    this.primaryHeaderWidth = defaultHeaderWidth,
    this.headerWidth = defaultHeaderWidth,
    this.itemHeight = defaultItemHeight,
    this.primaryItemWidth = defaultItemWidth,
    this.itemWidth = defaultItemWidth
  });
}

class StockTableView extends StatefulWidget {
  final StockTableDeletgate delegate;
  final StockTableMetrics metrics;

  StockTableView({
    this.delegate = ItemListStockTableDelegate(
      sampleItemList,
      "code",
      sampleHeaderMap
    ),
    this.metrics = const StockTableMetrics()
  });

  @override
  State<StatefulWidget> createState() {
    return _StockTableViewState();
  }
}

class _StockTableViewState extends State<StockTableView> {
  final ScrollController _headerScrollController = ScrollController();
  final ScrollController _gridScrollController = ScrollController();
  
  List<TableRow> _generateGridRows() {
    return List<TableRow>.generate(widget.delegate.numRows, (index) {
      return TableRow(
        children: _generateGridCells(index),
      );
    });
  }

  List<Widget> _generateGridCells(int row) {
    return List<Widget>.generate(widget.delegate.numColumns - 1, (index) {
      return widget.delegate.createCell(row, index + 1, this.widget);
    });
  }

  List<Widget> _generatePrimaryCells() {
    return List<Widget>.generate(widget.delegate.numRows, (int index) {
      return widget.delegate.createCell(index, 0, this.widget);
    });
  }

  List<Widget> _generateHeaderCells() {
    return List<Widget>.generate(widget.delegate.numColumns - 1, (index) {
      return widget.delegate.createHeaderCell(index + 1, this.widget);
    });
  }

  Widget _makeHeader() {
    return Row(
      children: <Widget>[
        widget.delegate.createHeaderCell(0, this.widget),
        Expanded(
          child: SingleChildScrollView(
            controller: _headerScrollController,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _generateHeaderCells(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _makeBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Row (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: _generatePrimaryCells(),
            ),

            Expanded(
              child: NotificationListener<ScrollUpdateNotification>(
                child: SingleChildScrollView(
                  controller: _gridScrollController,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    columnWidths: List<TableColumnWidth>.generate(5, (i) => FixedColumnWidth(146.0)).asMap(),
                    children: _generateGridRows(),
                  ),
                ),
                onNotification: (notification) {
                  // debugPrint(notification.toString());
                  _headerScrollController.jumpTo(notification.metrics.pixels);
                  return true;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _makeHeader(),
        _makeBody(),
      ],
    );
  }
}
