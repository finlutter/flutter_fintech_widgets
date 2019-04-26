import 'package:flutter/material.dart';
import '../widgets/carousel_view.dart';
import '../widgets/stock_info_widgets.dart';

class MarketHKPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselView(
          pageScroll: false,
          height: 108.0,
          children: <Widget>[
            CompactStockInfo(
              title: "恒生指数",
              price: "2138.47",
              changeAmount: "+0.24",
              changePercentage: "+0.37%",
            ),
            CompactStockInfo(
              title: "国企指数",
              price: "2138.47",
              changeAmount: "+0.24",
              changePercentage: "+0.37%",
            ),
            CompactStockInfo(
              title: "红筹指数",
              price: "2138.47",
              changeAmount: "+0.24",
              changePercentage: "+0.37%",
            ),
          ],
        ),
      ],
    );
  }

}