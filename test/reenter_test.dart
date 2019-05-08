import "package:test/test.dart";

import "../lib/base/reenter.dart";

class OnceTest extends AvoidReenter {
  Future<void> once() async {
    await Future.delayed(const Duration(milliseconds: 10));
  }

  Future<void> once1() async {
    await Future.delayed(const Duration(milliseconds: 10));
  }
}

void main() {
  test("once1", () async {
    OnceTest first = OnceTest();
    first.onceCall(first.once).then((_) {});
    expect(first.enterFlag(slot: 0), true);

    await Future.delayed(const Duration(milliseconds: 10));
    expect(first.enterFlag(slot: 0), false);
  });

  test("once-multi", () async {
    OnceTest second = OnceTest();

    //
    second.onceCall0(second.once).then((_) {});
    expect(second.enterFlag(slot: 0), true);

    await Future.delayed(const Duration(milliseconds: 10));
    expect(second.enterFlag(slot: 0), false);

    //
    second.onceCall1(second.once).then((_) {});
    expect(second.enterFlag(slot: 1), true);

    await Future.delayed(const Duration(milliseconds: 10));
    expect(second.enterFlag(slot: 1), false);
  });
}
