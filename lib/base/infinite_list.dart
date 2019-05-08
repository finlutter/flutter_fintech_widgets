import 'dart:async';

import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

void log(String s) {
  print('${DateTime.now()} $s');
}

/// Async function load more data,
/// return true for have more data, otherwise return false.
typedef LoadMore = Future<bool> Function();

class InfiniteList extends StatefulWidget {
  InfiniteList({
    this.child,
    @required this.loadMore,
    @required this.postLoadMore,
    @required this.scrollController,
  });

  final Widget child;
  final LoadMore loadMore;
  final VoidCallback postLoadMore;
  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  bool _isLoading = false;
  bool _haveMore = true;

  Future _loadMore() async {
    if (_isLoading || !_haveMore) return;

    setState(() {
      _isLoading = true;
    });

    _haveMore = await widget.loadMore();

    widget.postLoadMore();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      _isLoading
          ? Align(
              child: Container(
                width: 70.0,
                height: 70.0,
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text('Loading')
                        // CircularProgressIndicator()
                        )),
              ),
              alignment: FractionalOffset.bottomCenter,
            )
          : SizedBox(width: 0.0, height: 0.0),
      widget.child,
    ]);
  }
}

class Homeful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomefulState();
}

class _HomefulState extends State<Homeful> {
  final numbers = List.generate(10, (index) => index);
  final ScrollController scrollController = ScrollController();

  Future<bool> loadMore() async {
    await Future.delayed(const Duration(seconds: 2));
    numbers.addAll(List.generate(10, (index) => numbers.length + index));
    return numbers.length < 30;
  }

  @override
  Widget build(BuildContext context) {
    print('Homeful build ${numbers.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text("Homeful Test"),
      ),
      body: InfiniteList(
        scrollController: scrollController,
        loadMore: loadMore,
        postLoadMore: () {
          setState(() {});
        },
        child: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: AlignmentDirectional.center,
              height: 100,
              child: Text(numbers[index].toString()),
            );
          },
          controller: scrollController,
        ),
      ),
    );
  }
}

class Homeless extends StatelessWidget {
  final numbers = List.generate(10, (index) => index);
  final ScrollController scrollController = ScrollController();

  Future loadMore() async {
    await Future.delayed(const Duration(seconds: 2));
    numbers.addAll(List.generate(10, (index) => numbers.length + index));
  }

  @override
  Widget build(BuildContext context) {
    print('Homeless build ${numbers.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text("Homeless Test"),
      ),
      body: InfiniteList(
        scrollController: scrollController,
        child: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: AlignmentDirectional.center,
              height: 100,
              child: Text(numbers[index].toString()),
            );
          },
          controller: scrollController,
        ),
        loadMore: loadMore,
        postLoadMore: () {
          // setState(() {});
        },
      ),
    );
  }
}
