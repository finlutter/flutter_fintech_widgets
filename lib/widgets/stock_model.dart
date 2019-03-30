import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class StockDataItem {
  int time;
  int volume;
  double high;
  double low;
  double open;
  double close;

  StockDataItem.fromJson(Map<String, dynamic> json) {
    time = json["time"];
    volume = json["volume"];
    high = json["high"];
    low = json["low"];
    open = json["open"];
    close = json["close"];
  }
}

class StockData {
  static Map<String, StockData> dataSet = Map<String, StockData>();
  static StockData getBySourcePath(String path) {
    return dataSet[path];
  }
  static StockData getBySymbol(String symbol) {
    StockData data;
    dataSet.forEach((key, value) {
      if (value.symbol == symbol) {
        data = value;
      }
    });

    return data;
  }

  static
  Future<StockData> loadFromBundle(AssetBundle bundle, String symbol) {
    String path = "stocks/" + symbol + "/k_day.json";
    StockData stockData = StockData.getBySourcePath(path);
    
    if (stockData == null) {
      Completer<StockData> completer = Completer<StockData>();

      bundle.loadString(path).then((jsonString){
        Map<String, dynamic> jsonMap = json.decode(jsonString);
        stockData = StockData.fromJson(jsonMap);
        StockData.dataSet[path] = stockData;

        completer.complete(stockData);    
      });

      return completer.future;
    } else {
      return Future.value(stockData);
    }
  }

  String symbol;
  String period;

  StockData(this.symbol, this.period);

  double latestPrice;
  String name;

  List<StockDataItem> items;

  StockData.fromJson(Map<String, dynamic> json) {
    symbol = json["symbol"];
    period = json["period"];

    Map<String, dynamic> detail = json["detail"];
    name = detail["nameCN"];
    latestPrice = detail["latestPrice"];

    items = List<StockDataItem>();
    for (Map<String, dynamic> item in json["items"]) {
      items.add(StockDataItem.fromJson(item));
    }
  }
}
