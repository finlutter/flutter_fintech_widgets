import 'package:flutter/material.dart';
import 'candlestick_painter.dart';
import 'stock_model.dart';

class CandleSticksView extends StatefulWidget {
  final StockData _data;
  final Size _viewSize;

  CandleSticksView(this._data, this._viewSize);

  @override
  State<CandleSticksView> createState() {
    return _CandleStickViewState(_data);
  }

}

class _CandleStickViewState extends State<CandleSticksView> {
  StockData _data;
  CandleSticksPainterConfig _painterConfig;

  double _virtualWidth;

  _CandleStickViewState(this._data) {
    _painterConfig = CandleSticksPainterConfig();
    _virtualWidth = (_painterConfig.candleWidth + _painterConfig.candleMargin * 2) * _data.items.length;
  }

  void _onDragUpdate(double offset) {
    // debugPrint(offset.toString());
    setState(() {
      double newOffset = _painterConfig.viewOffset - offset;

      if (newOffset < 0) {
        newOffset = 0;
      }

      if (newOffset > _virtualWidth - widget._viewSize.width) {
        newOffset = _virtualWidth - widget._viewSize.width;
      }

      _painterConfig.viewOffset = newOffset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox (
      constraints: BoxConstraints.loose(
        Size(double.infinity, 500),
      ),
      child: GestureDetector(
        child: CustomPaint(
          painter: CandleStickPainter(_data, _painterConfig),
          size: widget._viewSize,
        ),

        // onHorizontalDragStart: (DragStartDetails details) => {
        //   debugPrint("Drag Start: ${details}")
        // },
        onHorizontalDragUpdate: (DragUpdateDetails details) => {
          _onDragUpdate(details.primaryDelta)
        },
        // onHorizontalDragEnd: (DragEndDetails details) => {
        //   debugPrint("Drag End: ${details}")
        // },
        // onHorizontalDragCancel: () => {
        //   debugPrint("Drag Canceled")
        // },
        // onHorizontalDragDown: (DragDownDetails details) => {
        //   debugPrint("Drag Down: ${details}")
        // },
      ),
    );
  }
}

