import 'package:flutter/material.dart';

abstract class StockTableDeletgate {
  const StockTableDeletgate();

  int get numColumns;
  int get numRows;
  
  Widget createHeaderCell(int columnIndex);
  Widget createCell(int rowIndex, int columnIndex);
}

class DummyStockTableDelegate extends StockTableDeletgate {
  final int numColumns;
  final int numRows;

  const DummyStockTableDelegate({
    this.numColumns = 6,
    this.numRows = 40
  });

  @override
  Widget createCell(int rowIndex, int columnIndex) {
    return Container(
      height: 48.0,
      width: 148.0,
      alignment: Alignment.center,
      color: rowIndex.isEven ? Colors.blueGrey[200] : Colors.white,
      child: Text('$rowIndex : $columnIndex'),
    );
  }

  @override
  Widget createHeaderCell(int columnIndex) {
    return Container(
      height: 48.0,
      width: 148.0,
      alignment: Alignment.center,
      color: Colors.green[100 * (columnIndex % 9)],
      child: Text('Column $columnIndex'),
    );
  }
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
    this.delegate = const DummyStockTableDelegate(),
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
      return widget.delegate.createCell(row, index + 1);
    });
  }

  List<Widget> _generatePrimaryCells() {
    return List<Widget>.generate(widget.delegate.numRows, (int index) {
      return widget.delegate.createCell(index, 0);
    });
  }

  List<Widget> _generateHeaderCells() {
    return List<Widget>.generate(widget.delegate.numColumns - 1, (index) {
      return widget.delegate.createHeaderCell(index + 1);
    });
  }

  Widget _makeHeader() {
    return Row(
      children: <Widget>[
        widget.delegate.createHeaderCell(0),
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
