import 'package:flutter/material.dart';
import '../widgets/tabbed_scaffold.dart';
import 'market_shsz_page.dart';
import 'market_hk_page.dart';
import 'market_am_page.dart';

class MarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabbedScaffold(
      children: <Widget>[
        MarketSHSZPage(),
        MarketHKPage(),
        MarketAMPage(),
      ],
      labels: [
        "沪深",
        "港股",
        "美股",
      ],
      labelStyle: TextStyle(fontSize: 16.0),
    );
  }
}
