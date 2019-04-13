import 'dart:async';
import '../stock/engine.dart';

class Source {
  String curentUrl(String code) {
    return 'http://hq.sinajs.cn/list=$code';
  }

  String historyUrl(String code, {int minutes: 5}) {
    return 'http://stock2.finance.sina.com.cn/futures/api/json.php/IndexService.getInnerFuturesMiniKLine${minutes}m?symbol=${code}';
  }
}
