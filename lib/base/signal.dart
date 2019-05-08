import 'package:flutter/foundation.dart';

///
/// Signal<String> signalString;
/// signalString.connect((String str) {
///   // got the `str` changed here
/// })
///

typedef ValueCallback<E> = void Function(E value);

abstract class Signable<E> {
  // Signable<bool> someValue;
  /// Register a closure to be called when the object notifies its listeners.
  void connect(ValueCallback<E> listener);

  /// Remove a previously registered closure from the list of closures that the
  /// object notifies.
  void disconnect(ValueCallback<E> listener);

  /// sink value changed
  void emit(E value);
}

///
class Signal<E> implements Signable {
  final ObserverList<ValueCallback<E>> _listeners =
      ObserverList<ValueCallback<E>>();

  bool _debugAssertNotDisposed() {
    assert(() {
      if (_listeners == null) {
        throw FlutterError('A $runtimeType was used after being disposed.\n'
            'Once you have called dispose() on a $runtimeType, it can no longer be used.');
      }
      return true;
    }());
    return true;
  }

  @override
  void connect(ValueCallback<E> listener) {
    _listeners.add(listener);
  }

  @override
  void disconnect(ValueCallback<E> listener) {
    _listeners.remove(listener);
  }

  @override
  void emit(dynamic value) {
    assert(_debugAssertNotDisposed());
    if (_listeners != null) {
      final List<ValueCallback<E>> localListeners =
          List<ValueCallback<E>>.of(_listeners);
      for (ValueCallback<E> listener in localListeners) {
        try {
          if (_listeners.contains(listener)) listener(value);
        } catch (exception, stack) {
          FlutterError.reportError(FlutterErrorDetails(
            exception: exception,
            stack: stack,
            library: 'signal',
            context: 'while dispatching notifications for $runtimeType',
            informationCollector: (StringBuffer information) {
              information.writeln('The $runtimeType sending notification was:');
              information.write('  $this');
            },
          ));
        }
      }
    }
  }
}
