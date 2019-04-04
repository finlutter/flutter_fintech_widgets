import 'package:flutter/material.dart';
import 'stock_model.dart';
import 'candlestick_view.dart';

class StockViewPage extends StatefulWidget {
  final String _symbol;

  StockViewPage(this._symbol);

  @override
  State<StockViewPage> createState() {
    return _StockViewPageState(_symbol);
  }
}

class _StockViewPageState extends State<StockViewPage> {
  String _symbol;
  StockData _data;

  _StockViewPageState(this._symbol);

  @override
  void didChangeDependencies() {
    StockData.loadFromBundle(DefaultAssetBundle.of(context), _symbol)
        .then((data) {
      _onDataReady(data);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_data != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_data.name),
        ),
        body: Column(
          children: <Widget>[
            CandleSticksView(_data, Size(500, 300)),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(_symbol),
        ),
        body: Container(
            alignment: Alignment.center, child: CircularProgressIndicator()),
      );
    }
  }

  void _onDataReady(StockData data) {
    setState(() {
      _data = data;
    });
  }
}
