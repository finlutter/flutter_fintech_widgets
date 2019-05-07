import 'package:flutter/material.dart';
import '../stock/model.dart';
import 'candlestick_painter.dart';

class VolumePainter extends CustomPainter {
  Stock _data;
  CandleSticksPainterConfig _config;
  List<TextPainter> gridLineTextPainters = [];

  VolumePainter(this._data, this._config);

  @override
  void paint(Canvas canvas, Size size) {
      // draw frame
    Paint framePaint = Paint();
    framePaint.color = Colors.grey;
    framePaint.strokeWidth = 1.5;
    canvas.drawLine(new Offset(0, 0), new Offset(size.width, 0), framePaint);
    canvas.drawLine(new Offset(size.width, 0), new Offset(size.width, size.height), framePaint);
    canvas.drawLine(new Offset(size.width, size.height), new Offset(0, size.height), framePaint);
    canvas.drawLine(new Offset(0, size.height), new Offset(0, 0), framePaint);

// draw separator
    canvas.drawLine(new Offset(0, size.height / 2), new Offset(size.width, size.height / 2), framePaint);

    // calculate which is the first and last item to draw.
    double extendWidth = _config.candleWidth + _config.candleMargin * 2;
    int start =
        ((_config.viewOffset + _config.candleMargin) / extendWidth).floor();
    int end = ((_config.viewOffset + size.width) / extendWidth).ceil();

    // calculate which is the base volume.
    double highestVolume = 0;

    for (int i = start; i < end; i++) {
      Bar x = _data.items[i];
      if (x.volume > highestVolume) highestVolume = x.volume;
    }

    // calculate price-to-height fraction.
    double fraction = highestVolume / size.height;

    // draw volume
    for (int i = start; i < end; i++) {
      Bar item = _data.items[i];

      double itemHeight;
      double itemTop;

      Paint paint = Paint();

      if (item.open > item.close) {
        // a candle for down
        paint.color = _config.downColor;
      } else {
        // a candle for up
        paint.color = _config.upColor;
      }
      
      itemHeight = item.volume / fraction;
      itemTop = (highestVolume - item.volume) / fraction;
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
    }

    // darw text
      double gridLineValue;
      int gridLineAmount = 3; // TODO config
      double width = size.width;
      final double height = size.height;
      double gridLineDist = height / (gridLineAmount - 1);
      double gridLineY;
      for (int i = 0; i < gridLineAmount; i++) {
        // Label grid lines
        gridLineValue = highestVolume -
            ((highestVolume / (gridLineAmount - 1)) * i);

        String gridLineText;
        if (gridLineValue < 1) {
          gridLineText = gridLineValue.toStringAsPrecision(4);
        } else if (gridLineValue < 999) {
          gridLineText = gridLineValue.toStringAsFixed(2);
        } else {
          gridLineText = gridLineValue.round().toString().replaceAllMapped(
              new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match m) => "${m[1]},");
        }

        gridLineTextPainters.add(new TextPainter(
            text: new TextSpan(
                text: gridLineText,
                style: new TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold)),
            textDirection: TextDirection.ltr));
        gridLineTextPainters[i].layout();
        gridLineY = (gridLineDist * i).round().toDouble();
        if (i == 0){
          gridLineY += 6;
        }else if (i == gridLineAmount - 1){
          gridLineY -= 6;
        }
        width = size.width - gridLineTextPainters[i].text.text.length * 6;

        // Label grid lines
        gridLineTextPainters[i]
            .paint(canvas, new Offset(width + 2.0, gridLineY - 6.0));
      }
  }

  @override
  bool shouldRepaint(VolumePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(VolumePainter oldDelegate) => false;
}