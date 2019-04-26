import 'package:flutter/material.dart';

class CarouselView extends StatefulWidget
  implements PreferredSizeWidget {

  final double height;
  final List<Widget> children;
  final bool pageScroll;
  final double itemExtent;

  CarouselView({
    @required this.children,
    this.height = 148.0,
    this.pageScroll = true,
    this.itemExtent = 128.0,
  });

  @override
  State<StatefulWidget> createState() => _CarouselViewState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CarouselViewState extends State<CarouselView> {
  @override
  Widget build(BuildContext context) {
    Widget content;

    if (widget.pageScroll) {
      content = PageView(
        children: widget.children,
      );
    } else {
      content = ListView(
        scrollDirection: Axis.horizontal,
        itemExtent: widget.itemExtent,
        children: widget.children,
      );
    }

    return Container(
      height: widget.height,
      child: content,
    );
  }
}
