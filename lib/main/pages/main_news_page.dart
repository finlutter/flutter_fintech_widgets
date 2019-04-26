import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          centerTitle: true,
          title: Text('资讯'),
        ),
        preferredSize: Size.fromHeight(48.0),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("This is item $index"),
            subtitle: Text("And a subtitle..."),
            trailing: Icon(
              Icons.broken_image,
              size: 64,
            ),
          );
        },
      ),
    );
  }
}
