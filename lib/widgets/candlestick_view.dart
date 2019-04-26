import 'package:flutter/material.dart';
import 'volume_painter.dart';
import 'candlestick_painter.dart';
import '../stock/model.dart';

class CandleSticksView extends StatefulWidget {
  final Stock stock;
  final Size _viewSize;

  CandleSticksView(this.stock, this._viewSize);

  @override
  State<CandleSticksView> createState() {
    return _CandleStickViewState();
  }
}

class _CandleStickViewState extends State<CandleSticksView> {
  CandleSticksPainterConfig painterConfig = CandleSticksPainterConfig();

  double virtualWidth;

  @override
  void initState() {
    super.initState();

    virtualWidth =
        (painterConfig.candleWidth + painterConfig.candleMargin * 2) *
            widget.stock.items.length;
  }

  void onDragUpdate(double offset) {
    // debugPrint(offset.toString());
    setState(() {
      double newOffset = painterConfig.viewOffset - offset;

      if (newOffset < 0) {
        newOffset = 0;
      }

      if (newOffset > virtualWidth - widget._viewSize.width) {
        newOffset = virtualWidth - widget._viewSize.width;
      }

      painterConfig.viewOffset = newOffset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(
        Size(double.infinity, 500),
      ),
      child: GestureDetector(
        child: ListView(
          children: <Widget>[
            CustomPaint(
              painter: CandleStickPainter(widget.stock, painterConfig),
              size: Size(widget._viewSize.width, widget._viewSize.height * 0.7),
            ),
             CustomPaint(
              painter: VolumePainter(widget.stock, painterConfig),
              size: Size(widget._viewSize.width, widget._viewSize.height - widget._viewSize.height * 0.7),
             ),
          ],
        ),

        // onHorizontalDragStart: (DragStartDetails details) => {
        //   debugPrint("Drag Start: ${details}")
        // },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          onDragUpdate(details.primaryDelta);
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
