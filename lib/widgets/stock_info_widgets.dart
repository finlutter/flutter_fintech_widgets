import 'package:flutter/material.dart';

class CompactStockInfo extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;
  final String changeAmount;
  final String changePercentage;

  CompactStockInfo({
    this.title,
    this.subTitle,
    this.price,
    this.changeAmount,
    this.changePercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: InkWell(
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.0, height: 2),
              ),
              Text(
                price,
                style: TextStyle(fontSize: 16.0, height: 1.2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    changeAmount,
                    style: TextStyle(fontSize: 13.0),
                  ),
                  Text(
                    changePercentage,
                    style: TextStyle(fontSize: 13.0),
                  ),
                ],
              ),
            ],
          ),
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint("index tapped");
          },
        ),
      ),
    );
  }
}

class CompactCategoryInfo extends StatelessWidget {
  final String title;
  final String mainDisplayValue;
  final String subTitle;
  final String subDisplayValue;

  CompactCategoryInfo({
    this.title,
    this.mainDisplayValue,
    this.subTitle,
    this.subDisplayValue,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(title),
              Text(mainDisplayValue),
            ],
          ),
          Row(
            children: [
              Text(subTitle),
              Text(subDisplayValue),
            ],
          ),
        ],
      ),
      onTap: () {
        debugPrint("Category tapped");
      },
    );
  }
}

class MarketInfoCard extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool hasTitleBar;
  final bool expandable;
  final List<Widget> actions;
  final String title;
  final Widget child;

  MarketInfoCard({
    this.height,
    this.hasTitleBar,
    this.expandable,
    this.actions,
    this.title,
    this.child,
  });

  Widget _buildTitleBar() {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        debugPrint("card title bar tapped");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (hasTitleBar) {
      content = Card(
        child: Column(
          children: [
            _buildTitleBar(),
            child,
          ],
        ),
      );
    } else {
      content = Card(
        child: child,
      );
    }

    return SizedBox.fromSize(
      size: Size.fromHeight(height),
      child: content,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
