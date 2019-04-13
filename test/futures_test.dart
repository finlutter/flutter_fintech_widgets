import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_fintech_widgets/futures/models.dart';

void main() {
  testWidgets('Futures model parse', (WidgetTester tester) async {
    String text =
        'var hq_str_M0="豆粕连续,225954,2604.00,2610.00,2601.00,2601.00,2604.00,2605.00,2604.00,2605.00,2607.00,246,254,2038800,463564,连,豆粕,2019-04-12,0,2661.000,2595.000,2661.000,2568.000,2661.000,2499.000,2661.000,2467.000,31.563";';

    Futures f = Futures.fromSina(text);

    expect(f.code, equals('M0'));
    expect(f.name, equals('豆粕连续')); // 0
    expect(f.latest, equals(2604.0));
    expect(f.open, equals(2604.0));
    expect(f.high, equals(2610.0));
    expect(f.low, equals(2601.0));
    expect(f.close, equals(2605.0));
    expect(f.prevClose, equals(2607.0)); // 5
    expect(f.totalVolume, equals(2038800));
    expect(f.volume, equals(463564));
    expect(f.bidAmount, equals(246));
    expect(f.askAmount, equals(254));
  });
}
