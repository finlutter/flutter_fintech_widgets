import 'package:flutter/material.dart';
import 'stock_model.dart';

class CandleSticksPainterConfig {
  // width of each candle, in points.
  double candleWidth;

  // margin(left/right) of each candle, in points.
  double candleMargin;

  // stroke width of shadow lines, in points.
  double shadowStrokeWidth;

  // color for price up (open < close)
  Color upColor;

  // color for price down (open > close)
  Color downColor;

  // where the canvas to draw in x-axis.
  double viewOffset;

  CandleSticksPainterConfig(
      {double candleWidth,
      double candleMargin,
      double shadowStrokeWidth,
      Color upColor,
      Color downColor,
      double viewOffset})
      : candleWidth = 15.0,
        candleMargin = 1.0,
        shadowStrokeWidth = 2.0,
        upColor = Colors.red,
        downColor = Colors.green,
        viewOffset = 0.0;
}

class CandleStickPainter extends CustomPainter {
  StockData _data;
  CandleSticksPainterConfig _config;

  CandleStickPainter(this._data, this._config);

  @override
  void paint(Canvas canvas, Size size) {
    // calculate which is the first and last item to draw.
    double extendWidth = _config.candleWidth + _config.candleMargin * 2;
    int start =
        ((_config.viewOffset + _config.candleMargin) / extendWidth).floor();
    int end = ((_config.viewOffset + size.width) / extendWidth).ceil();

    // calculate which is the base price.
    double lowestPrice = double.infinity;
    double highestPrice = 0;

    for (int i = start; i < end; i++) {
      StockDataItem x = _data.items[i];
      if (x.high > highestPrice) highestPrice = x.high;
      if (x.low < lowestPrice) lowestPrice = x.low;
    }

    // calculate price-to-height fraction.
    double fraction = (highestPrice - lowestPrice) / size.height;

    // draw candles and shadows
    for (int i = start; i < end; i++) {
      StockDataItem item = _data.items[i];

      double itemHeight;
      double itemTop;

      Paint paint = Paint();

      // draw candle
      if (item.open > item.close) {
        // a candle for down
        paint.color = _config.downColor;
        itemHeight = (item.open - item.close) / fraction;
        itemTop = (highestPrice - item.open) / fraction;
      } else {
        // a candle for up
        paint.color = _config.upColor;
        itemHeight = (item.close - item.open) / fraction;
        itemTop = (highestPrice - item.close) / fraction;
      }

      double itemLeft =
          extendWidth * i + _config.candleMargin - _config.viewOffset;
      double itemWidth = _config.candleWidth;
      Rect itemRect = Rect.fromLTWH(itemLeft, itemTop, itemWidth, itemHeight);

      if (itemLeft < 0) {
        if (itemLeft + _config.candleWidth <= 0) {
          debugPrint("???");
          continue;
        }
        // assert((itemLeft + _config.candleWidth > 0));
        itemRect = Rect.fromLTWH(
            0, itemTop, _config.candleWidth + itemLeft, itemHeight);
      }
      if (itemLeft + _config.candleWidth > size.width) {
        if (itemLeft >= size.width) {
          debugPrint("???");
          continue;
        }
        // assert((itemLeft < size.width));
        itemRect =
            Rect.fromLTWH(itemLeft, itemTop, size.width - itemLeft, itemHeight);
      }

      canvas.drawRect(itemRect, paint);

      // draw shadow
      paint.strokeWidth = _config.shadowStrokeWidth;

      double shadowX = itemLeft + _config.candleWidth / 2;
      if (shadowX > 0 && shadowX < size.width) {
        Offset lineStart =
            Offset(shadowX, (highestPrice - item.high) / fraction);
        Offset lineEnd = Offset(shadowX, (highestPrice - item.low) / fraction);

        canvas.drawLine(lineStart, lineEnd, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
