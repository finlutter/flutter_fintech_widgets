import 'package:flutter/material.dart';

class IconBoardView extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: 248,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(248);
}
