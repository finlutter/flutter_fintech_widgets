import 'dart:io';

import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _case = 0;
  int _currentIndex = 0;
  TabItem _currentItem = TabItem.home;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
      ),
      body: buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget buildBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Button(
                  text: '原生实现',
                  onPress: () => setState(() {
                        _case = 0;
                      }),
                ),
                Container(width: 10.0),
                Button(
                  text: '$_type',
                  onPress: () => setState(() {
                        _type = _type == BottomNavigationBarType.shifting
                            ? BottomNavigationBarType.fixed
                            : BottomNavigationBarType.shifting;
                      }),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Button(
                  text: '2B实现',
                  onPress: () => setState(() {
                        _case = 1;
                      }),
                ),
                Container(width: 10.0),
                Button(
                  text: '$_type',
                  onPress: () => setState(() {
                        _type = _type == BottomNavigationBarType.shifting
                            ? BottomNavigationBarType.fixed
                            : BottomNavigationBarType.shifting;
                      }),
                ),
              ],
            ),
            Button(
              text: '改进实现',
              onPress: () => setState(() {
                    _case = 2;
                  }),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    switch (_case) {
      case 0:
        return BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            type: _type,
            items: [
              new BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text('home'),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.add_a_photo),
                title: new Text('phone'),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.mail),
                title: new Text('mail'),
              ),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.map), title: new Text('map'))
            ]);
      case 1:
        return BottomNavigationBar(
          type: _type,
          items: [
            _buildItem(icon: Icons.home, tabItem: TabItem.home),
            _buildItem(icon: Icons.phone, tabItem: TabItem.phone),
            _buildItem(icon: Icons.mail, tabItem: TabItem.mail),
            _buildItem(icon: Icons.map, tabItem: TabItem.map),
          ],
          onTap: _onTabTapped,
        );
      case 2:
        return SafeArea(
            child: SizedBox(
                height: 50.0,
                child: Card(
                    color: Platform.isIOS ? Colors.transparent : Colors.white,
                    elevation: Platform.isIOS ? 0.0 : 8.0,
                    // iphone 无阴影
                    shape: RoundedRectangleBorder(),
                    margin: EdgeInsets.all(0.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Divider(color: Color(0xFFE0E0E0), height: 0.5),
                          Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  _buildBottomItem(
                                      icon: Icons.home, text: '首页', index: 0),
                                  _buildBottomItem(
                                      icon: Icons.phone, text: '数据', index: 1),
                                  _buildBottomItem(
                                      icon: Icons.mail, text: '我的', index: 2),
                                  _buildBottomItem(
                                      icon: Icons.map, text: '我的', index: 3),
                                ]),
                          )
                        ]))));
    }
    return Container();
  }

  Widget _buildBottomItem({IconData icon, String text, int index}) {
    Color color =
        _currentIndex == index ? Theme.of(context).primaryColor : Colors.grey;
    return Expanded(
        child: InkResponse(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(icon, color: color, size: 22.0),
                  // Image.asset(, color: color, width: 22.0, height: 22.0),
                  Text(text, style: TextStyle(color: color, fontSize: 10.0))
                ]),
            onTap: () => setState(() => _currentIndex = index)));
  }

  BottomNavigationBarItem _buildItem({IconData icon, TabItem tabItem}) {
    String text = tabItemName(tabItem);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return _currentItem == item ? Theme.of(context).primaryColor : Colors.grey;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _currentItem = TabItem.values[_currentIndex];
    });
  }
}

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const Button({Key key, this.text, @required this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      child: Text('$text', style: TextStyle(color: Colors.white)),
      onPressed: onPress,
    );
  }
}

enum TabItem {
  home,
  phone,
  mail,
  map,
}

String tabItemName(TabItem tabItem) {
  switch (tabItem) {
    case TabItem.home:
      return "home";
    case TabItem.phone:
      return "phone";
    case TabItem.mail:
      return "mail";
    case TabItem.map:
      return "map";
  }
  return null;
}
