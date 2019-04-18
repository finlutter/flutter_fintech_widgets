import 'package:flutter/material.dart';

class CarouselView extends StatefulWidget implements PreferredSizeWidget{
  @override
  State<StatefulWidget> createState() {
    return _CarouselViewState();
  }

  @override
  Size get preferredSize => Size.fromHeight(152.0);
}

class _CarouselViewState extends State<CarouselView> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: 152,
    );
  }
}
