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

  double leftMargin = 5;
  double rightMargin = 5;

  double virtualWidth;

  @override
  void initState() {
    super.initState();
// 直接使用widget._viewSize.width，不能反映屏幕的真实宽度？？？
    virtualWidth =
        (painterConfig.candleWidth + painterConfig.candleMargin * 2) *
            widget.stock.items.length;
      double newOffset = virtualWidth - (widget._viewSize.width - leftMargin - rightMargin) - painterConfig.candleMargin;;
      if (newOffset < 0) {
        newOffset = 0;
      }

      if (newOffset > virtualWidth - (widget._viewSize.width - leftMargin - rightMargin)) {
        newOffset = virtualWidth - (widget._viewSize.width - leftMargin - rightMargin);
      }
    painterConfig.viewOffset = newOffset;
  }

  void onDragUpdate(double offset) {
    // debugPrint(offset.toString());
    setState(() {
      double newOffset = painterConfig.viewOffset - offset;

      if (newOffset < 0) {
        newOffset = 0;
      }

      if (newOffset > virtualWidth - (widget._viewSize.width - leftMargin - rightMargin)) {
        newOffset = virtualWidth - (widget._viewSize.width - leftMargin - rightMargin);
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
            Container(
              margin: EdgeInsets.fromLTRB(leftMargin, 5, rightMargin, 5),
              child: new CustomPaint(
                painter: CandleStickPainter(widget.stock, painterConfig),
                size:
                    Size(widget._viewSize.width - leftMargin - rightMargin, widget._viewSize.height * 0.7),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(leftMargin, 5, rightMargin, 5),
              child: new CustomPaint(
                painter: VolumePainter(widget.stock, painterConfig),
                size: Size(widget._viewSize.width - leftMargin -rightMargin,
                    widget._viewSize.height * (1 - 0.7) - 20),
              ),
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
