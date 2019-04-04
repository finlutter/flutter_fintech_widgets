import 'package:flutter/material.dart';
import '../widgets/stock_view.dart';

class SimpleListView extends StatelessWidget {
  final List<String> items =
      new List<String>.generate(10000, (i) => "Item ${i}");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text("${items[index]}"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StockViewPage("00700")));
              },
            );
          }),
    );
  }
}
