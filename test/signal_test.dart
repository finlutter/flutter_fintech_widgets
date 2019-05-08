import "package:test/test.dart";

import "../lib/base/signal.dart";

void main() {
  test("signal", () {
    Signal<String> broadcast = Signal<String>();
    List<String> res = <String>[];
    var cb = (String value) {
      res.add(value);
    };

    broadcast.connect(cb);

    broadcast.emit("hello");
    broadcast.emit("world");
    expect(res, ["hello", "world"]);

    broadcast.disconnect(cb);
    broadcast.emit("!");
    expect(res, ["hello", "world"]);
  });

  test("signal.reenter", () {
    Signal<String> broadcast = Signal<String>();

    List<String> res1 = <String>[];
    void cb1(String value) {
      res1.add(value);
      broadcast.disconnect(cb1);
    }

    broadcast.connect(cb1);

    List<String> res2 = <String>[];
    void cb2(String value) {
      res2.add(value);
    }

    broadcast.connect(cb2);

    broadcast.emit("hello");
    broadcast.emit("world");
    expect(res1, ["hello"]);
    expect(res2, ["hello", "world"]);

    broadcast.emit("!");
    expect(res1, ["hello"]);
    expect(res2, ["hello", "world", "!"]);
  });
}
