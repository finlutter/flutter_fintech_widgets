import 'package:flutter/material.dart';
import '../../widgets/carousel_view.dart';
import '../../widgets/icon_board_view.dart';
import '../../widgets/pinned_page_view.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          CarouselView(),
          IconBoardView(),
          PinnedPageView()
        ],
      ),
    );
  }
}

