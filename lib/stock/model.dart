import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'engine.dart';
import 'gu.dart';

class Stock extends Model {
  Stock(this.symbol);

  final String symbol;
  String name;
  List<Bar> items = <Bar>[];

  List<Bar> parseList(String js) {
    assert(js.startsWith("kline_dayqfq="));

    Map<String, dynamic> jd = json.decode(js.substring("kline_dayqfq=".length))
        as Map<String, dynamic>;

    Map<String, dynamic> dataMap =
        (jd["data"] as Map<String, dynamic>)[symbol] as Map<String, dynamic>;

    List bars;
    if (dataMap.containsKey("qfqday"))
      bars = dataMap["qfqday"] as List;
    else
      bars = dataMap["day"] as List;
    return bars.map((array) {
      List arr = array as List;
      // 2018-12-24, 9.980, 9.910, 10.040, 9.860, 227798.000
      return Bar(
        time: DateTime.parse(arr[0]),
        open: double.parse(arr[1]),
        close: double.parse(arr[2]),
        high: double.parse(arr[3]),
        low: double.parse(arr[4]),
        volume: double.parse(arr[5]),
      );
    }).toList();
  }

  /// TODO: date or count
  Future<List<Bar>> loadItems() async {
    Completer<List<Bar>> completer = new Completer<List<Bar>>();

    NetworkEngine.instance().then((engine) {
      engine.getWithCache(UrlForKLine(symbol)).then((js) {
        items = parseList(js);
        completer.complete(items);
      });
    });

    return completer.future;
  }

  /// scoped_model type load
  void load() {
    NetworkEngine.instance().then((engine) {
      engine.getWithCache(UrlForKLine("symbol")).then((js) {
        items = parseList(js);

        notifyListeners();
      });
    });
  }
}

class Bar {
  Bar({
    this.time,
    this.open,
    this.close,
    this.high,
    this.low,
    this.volume,
  });

  final DateTime time;

  final double open;
  final double close;
  final double high;
  final double low;

  final double volume;

  String toString() {
    return "Stock.Bar(time=$time, open=$open, close=$close, low=$low, high=$high, volume=$volume)";
  }
}

class CandleStyle {
  ///
  factory CandleStyle.styleChinese() {
    return CandleStyle(
      backgroundColor: Colors.black54, // Colors.black, 11141b
      assetsColor: Colors.white10,
      fillGrowing: false,
      growColor: Colors.red,
      fallColor: Colors.green,
    );
  }

  const CandleStyle({
    this.lineWidth: 1.0,
    this.backgroundColor,
    this.assetsColor,
    this.fillGrowing,
    this.growColor,
    this.fallColor,
    this.spacing: 1.0,
    this.width: 5.0,
    this.paddingLeft: 0.0,
    this.paddingTop: 10.0,
  });

  final double lineWidth;

  final Color backgroundColor;
  final Color assetsColor;

  /// 实心阳线
  final bool fillGrowing;
  final Color growColor;
  final Color fallColor;

  /// width between two candle
  final double spacing;

  /// candle width
  final double width;

  /// 左右两边空隙
  final double paddingLeft;

  /// 上下两边空隙
  final double paddingTop;

  /// TODO: 跳空缺口
}

/// calculate extent
class CandleContext {
  CandleContext(List<Bar> items) {
    items.forEach((Bar) {
      minPrice = min(Bar.low, minPrice);
      maxPrice = max(Bar.high, maxPrice);

      if (minVolume > Bar.volume) minVolume = Bar.volume;
      if (maxVolume < Bar.volume) maxVolume = Bar.volume;
    });

    assert(minPrice != double.infinity);
    assert(maxPrice != -double.infinity);
    assert(minVolume != double.infinity);
    assert(maxVolume != -double.infinity);
  }

  String toString() {
    return "CandleContext: price [$minPrice-$maxPrice] volume: [$minVolume-$maxVolume]";
  }

  double minPrice = double.infinity;
  double maxPrice = -double.infinity;
  double minVolume = double.infinity;
  double maxVolume = -double.infinity;
}
