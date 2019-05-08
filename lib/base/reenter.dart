import 'dart:async';
import 'package:meta/meta.dart';

typedef AsyncCallback = Future<void> Function();

/// Avoid reenter for long-time fuction
abstract class AvoidReenter {
  ///
  /// `func` implement notice: should use await
  Future onceCall(
    AsyncCallback func, {
    int slot: 0,
  }) async {
    assert(slot < _flagList.length);

    if (_flagList[slot]) return;

    try {
      _flagList[slot] = true;
      return await func();
    } finally {
      _flagList[slot] = false;
    }
  }

  /// Flag
  bool enterFlag({@required int slot}) {
    assert(slot < _flagList.length);

    return _flagList[slot];
  }

  List<bool> _flagList = <bool>[false, false, false];

  // convenience call
  Future onceCall0(AsyncCallback func) async {
    onceCall(func, slot: 0);
  }

  Future onceCall1(AsyncCallback func) async {
    onceCall(func, slot: 1);
  }

  Future onceCall2(AsyncCallback func) async {
    onceCall(func, slot: 2);
  }
}
