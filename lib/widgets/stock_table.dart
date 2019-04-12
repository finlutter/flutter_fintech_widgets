import 'package:flutter/material.dart';

abstract class StockTableData {
  String get pageTitle;
  String get primaryHeaderText;
  List<String> get columns;
  Map<String, List<String>> get items;
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

class StockTableViewPage extends StatefulWidget {
  final StockTableData data;
  final StockTableMetrics metrics;

  StockTableViewPage({
    this.data,
    this.metrics = const StockTableMetrics()
  });

  @override
  State<StatefulWidget> createState() {
    return _StockTableViewPageState();
  }
}

class _StockTableViewPageState extends State<StockTableViewPage> {
  final ScrollController _headerScrollController = ScrollController();
  final ScrollController _gridScrollController = ScrollController();
  
  List<TableRow> _generateGridRows() {
    return List<TableRow>.generate(40, (index) {
      return TableRow(
        children: _generateGridCells(index),
      );
    });
  }

  List<Widget> _generateGridCells(int row) {
    return List<Widget>.generate(5, (index) {
      return Container(
        height: 48.0,
        width: 148.0,
        alignment: Alignment.center,
        color: row.isEven ? Colors.blueGrey[200] : Colors.white,
        child: Text('$row : $index'),
      );
    });
  }

  List<Widget> _generatePrimaryCells() {
    return List<Widget>.generate(40, (int index) {
      return Container(
        height: 48.0,
        width: 148.0,
        alignment: Alignment.center,
        color: Colors.lightBlue[100 * (index % 9)],
        child: Text('list item $index'),
      );
    });
  }

  List<Widget> _generateHeaderCells() {
    return List<Widget>.generate(5, (index) {
      return Container(
        height: 48.0,
        width: 148.0,
        alignment: Alignment.center,
        color: Colors.green[100 * (index % 9)],
        child: Text('Column $index'),
      );
    });
  }

  Widget _makeHeader() {
    return Row(
      children: <Widget>[
        Container(
          height: 48.0,
          width: 148.0,
          alignment: Alignment.center,
          child: Text('name / code'),
        ),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Stocks Table"),
      ),
      body: Column(
        children: <Widget>[
          _makeHeader(),
          _makeBody(),
        ],
      ),
    );
  }
}
