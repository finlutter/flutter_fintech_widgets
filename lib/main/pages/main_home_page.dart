import 'package:flutter/material.dart';
import '../../widgets/carousel_view.dart';
import '../../widgets/icon_board_view.dart';

class HomePage extends StatelessWidget {

  CarouselView _buildCarousel() {
    return CarouselView(
      height: 152.0,
      children: [
        Container(
          height: 152.0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text("Page One"),
          ),
        ),
        Container(
          height: 152.0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text("Page Two"),
          ),
        ),
        Container(
          height: 152.0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text("Page Three"),
          ),
        ),
        Container(
          height: 152.0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text("Page Four"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 6,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: <Widget>[
                      _buildCarousel(),
                      IconBoardView(),
                    ],
                  ),
                  collapseMode: CollapseMode.none,
                ),
                leading: Icon(
                  Icons.person,
                  size: 32.0,
                ),
                title: Container(
                  alignment: Alignment.topCenter,
                  height: 25.0,
                  padding: EdgeInsets.only(bottom: 6.0),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "搜索点儿啥",
                      filled: true,
                      fillColor: Colors.lightGreen,
                      contentPadding: EdgeInsets.all(5.0),
                    ),
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.mail,
                      size: 32.0,
                    ),
                    onPressed: () {
                      debugPrint("Message Button Pressed");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more,
                      size: 32.0,
                    ),
                    onPressed: () {
                      debugPrint("More Button Pressed");
                    },
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                ],
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  delegated: TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "动态"),
                      Tab(text: "关注"),
                      Tab(text: "要闻"),
                      Tab(text: "推荐"),
                      Tab(text: "自选"),
                      Tab(text: "快讯"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.builder(
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
              Center(child: Text("Page 2")),
              Center(child: Text("Page 3")),
              Center(child: Text("Page 4")),
              Center(child: Text("Page 5")),
              Center(child: Text("Page 6")),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar delegated;

  _SliverAppBarDelegate({@required this.delegated});

  @override
  double get minExtent => delegated.preferredSize.height;

  @override
  double get maxExtent => delegated.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return new Container(
      color: Colors.white,
      child: delegated,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
