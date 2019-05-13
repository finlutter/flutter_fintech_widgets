import 'package:flutter/material.dart';

import '../stock/model.dart';

import 'candlestick_view.dart';

class StockViewPage extends StatefulWidget {
  final String symbol;

  StockViewPage(this.symbol);

  @override
  State<StockViewPage> createState() {
    return _StockViewPageState();
  }
}

class _StockViewPageState extends State<StockViewPage> {
  Stock _data;

  @override
  void initState() {
    super.initState();

    _data = Stock(widget.symbol);
    _data.loadItems().then((x) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(_data != null ? _data.symbol : ''),
      ),
      body: _data != null && _data.items.isNotEmpty
          ? Column(
              children: <Widget>[
                CandleSticksView(_data, Size(size.width, 500)),
              ],
            )
          : Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
    );
  }
}
