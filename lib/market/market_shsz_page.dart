import 'package:flutter/material.dart';
import '../widgets/carousel_view.dart';
import '../widgets/stock_info_widgets.dart';

class MarketSHSZPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselView(
          pageScroll: false,
          height: 108.0,
          children: <Widget>[
            CompactStockInfo(
              title: "上证指数",
              price: "2138.47",
              changeAmount: "+0.24",
              changePercentage: "+0.37%",
            ),
            CompactStockInfo(
              title: "深证成指",
              price: "2138.47",
              changeAmount: "+0.24",
              changePercentage: "+0.37%",
            ),
            CompactStockInfo(
              title: "创业板指",
              price: "2138.47",
              changeAmount: "+0.24",
              changePercentage: "+0.37%",
            ),
            CompactStockInfo(
              title: "中小板指",
              price: "2138.47",
              changeAmount: "+0.24",
              changePercentage: "+0.37%",
            ),
          ],
        ),
        MarketInfoCard(
          height: 168.0,
          hasTitleBar: true,
          title: "行业板块",
          child: Column(
            children: [
              Row(
                children: [
                  CompactCategoryInfo(
                    title: "休闲服务",
                    mainDisplayValue: "2.27%",
                    subTitle: "中国国旅",
                    subDisplayValue: "56.30 +8.10%",
                  ),
                  CompactCategoryInfo(
                    title: "机械设备",
                    mainDisplayValue: "0.37%",
                    subTitle: "天华苑",
                    subDisplayValue: "11.30 -10.00%",
                  ),
                ],
              ),
              Row(
                children: [
                  CompactCategoryInfo(
                    title: "化工",
                    mainDisplayValue: "2.27%",
                    subTitle: "中国国旅",
                    subDisplayValue: "56.30 +8.10%",
                  ),
                  CompactCategoryInfo(
                    title: "采掘",
                    mainDisplayValue: "0.96%",
                    subTitle: "天华苑",
                    subDisplayValue: "11.30 -10.00%",
                  ),
                ],
              ),
            ],
          ),
        ),
        MarketInfoCard(
          height: 168.0,
          hasTitleBar: true,
          title: "概念板块",
          child: Column(
            children: [
              Row(
                children: [
                  CompactCategoryInfo(
                    title: "分散染料",
                    mainDisplayValue: "1.32%",
                    subTitle: "中国国旅",
                    subDisplayValue: "56.30 +8.10%",
                  ),
                  CompactCategoryInfo(
                    title: "油改概念",
                    mainDisplayValue: "1.32%",
                    subTitle: "仁智股份",
                    subDisplayValue: "11.30 -10.00%",
                  ),
                ],
              ),
              Row(
                children: [
                  CompactCategoryInfo(
                    title: "可燃冰",
                    mainDisplayValue: "2.27%",
                    subTitle: "中国国旅",
                    subDisplayValue: "56.30 +8.10%",
                  ),
                  CompactCategoryInfo(
                    title: "页岩气",
                    mainDisplayValue: "1.53%",
                    subTitle: "天华苑",
                    subDisplayValue: "11.30 -10.00%",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
