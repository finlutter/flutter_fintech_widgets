import 'package:flutter/material.dart';

class TabbedScaffold extends StatefulWidget {
  final Color backgroundColor;
  final Widget leading;
  final List<Widget> actions;
  final List<Widget> children;
  final List<String> labels;
  final TextStyle labelStyle;

  const TabbedScaffold(
      {Key key,
      this.backgroundColor,
      this.leading,
      this.actions,
      this.children,
      this.labels,
      this.labelStyle = const TextStyle(fontSize: 20.0)})
      : super(key: key);

  @override
  TabbedScaffoldState createState() => TabbedScaffoldState();
}

class TabbedScaffoldState extends State<TabbedScaffold> {
  Widget _buildTitle() {
    List<Widget> tabs = List<Widget>();
    widget.labels.forEach((tabName) {
      tabs.add(Tab(text: tabName));
    });

    return TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.all(12.0),
      indicatorSize: TabBarIndicatorSize.label,
      tabs: tabs,
      labelStyle: widget.labelStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.children.length,
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
                leading: widget.leading,
                actions: widget.actions,
                centerTitle: true,
                title: _buildTitle()),
            preferredSize: Size.fromHeight(48.0)),
        body: TabBarView(
          children: widget.children,
        ),
      ),
    );
  }
}
