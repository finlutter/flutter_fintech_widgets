import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                size: 32,
              ),
              onPressed: () {
                debugPrint("Settings button pressed");
              },
            )
          ],
        ),
        body: new ListView(children: <Widget>[
          Card(
            child: Row(
              children: <Widget>[
                Icon(Icons.person, size: 128),
                Text("我的名字")
              ],
            ),
          ),
          Card(
            child: SizedBox.fromSize(
              size: Size.fromHeight(64.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                // padding: EdgeInsets.all(6.0),
                itemExtent: 128.0,
                children: <Widget>[
                  Container(
                    color: Theme.of(context).backgroundColor,
                    padding: EdgeInsets.all(6.0),
                    child: RaisedButton(
                      elevation: 5.0,
                      child: Text("我的组合"),
                      color: Colors.black38,
                      textColor: Colors.white,
                      onPressed: () {
                        debugPrint("Button Pressed");
                      },
                    ),
                  ),
                  Container(
                    color: Theme.of(context).backgroundColor,
                    padding: EdgeInsets.all(6.0),
                    child: RaisedButton(
                      elevation: 5.0,
                      child: Text("我的投顾"),
                      color: Colors.black38,
                      textColor: Colors.white,
                      onPressed: () {
                        debugPrint("Button Pressed");
                      },
                    ),
                  ),
                  Container(
                    color: Theme.of(context).backgroundColor,
                    padding: EdgeInsets.all(6.0),
                    child: RaisedButton(
                      elevation: 5.0,
                      child: Text("我的理财"),
                      color: Colors.black38,
                      textColor: Colors.white,
                      onPressed: () {
                        debugPrint("Button Pressed");
                      },
                    ),
                  ),
                  Container(
                    color: Theme.of(context).backgroundColor,
                    padding: EdgeInsets.all(6.0),
                    child: RaisedButton(
                      elevation: 5.0,
                      child: Text("我的特权"),
                      color: Colors.black38,
                      textColor: Colors.white,
                      onPressed: () {
                        debugPrint("Button Pressed");
                      },
                    ),
                  ),
                  Container(
                    color: Theme.of(context).backgroundColor,
                    padding: EdgeInsets.all(6.0),
                    child: RaisedButton(
                      elevation: 5.0,
                      child: Text("我的不知道还有点儿啥"),
                      color: Colors.black38,
                      textColor: Colors.white,
                      onPressed: () {
                        debugPrint("Button Pressed");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("我的收藏"),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text("我的消息"),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text("我的服务"),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text("邀请朋友"),
            trailing: Icon(Icons.arrow_right),
          ),
        ]));
  }
}
