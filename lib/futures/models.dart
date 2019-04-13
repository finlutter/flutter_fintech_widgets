// 查看 http://finance.sina.com.cn/futures/quotes/M0.shtml 页面，发现含义如下：
// https://hq.sinajs.cn/?_=1555087374396/&list=M0
// https://hq.sinajs.cn/?_=1555087374395/&list=M0,RB1910,I1909,TA1909,M1909,SR1909,MA1909,RM1909,NI1906,C1909,PP1909,BU1906,J1909,HC1910

class Futures {
  final String code;
  final String name;
  final double latest;
  final double open;
  final double high;
  final double low;
  final double close;
  final double prevClose;
  final double settletment;
  final double prevSettletment;
  final double totalVolume;
  final double volume;
  final double bid;
  final double ask;
  final int bidAmount;
  final int askAmount;
  final String market;

  const Futures({
    this.code,
    this.name,
    this.market,
    this.latest,
    this.open,
    this.high,
    this.low,
    this.close,
    this.prevClose,
    this.settletment,
    this.prevSettletment,
    this.totalVolume,
    this.volume,
    this.bid,
    this.ask,
    this.bidAmount,
    this.askAmount,
  });

  factory Futures.fromSina(String text) {
    // 0-4
    // var hq_str_M0="豆粕连续,225954,2604.00,2610.00,2601.00,
    // 5
    // 2601.00,
    // 6-10
    // 2604.00,2605.00,2604.00,2605.00,2607.00,
    // 11-17
    // 246,254,2038800,463564,连,豆粕,2019-04-12,
    // 0,2661.000,2595.000,2661.000,2568.000,2661.000,2499.000,2661.000,2467.000,31.563";
    // ["price","open-price","max-price","min-price",
    // "close-price","yestoday-price","amount","volume",
    // "buy","sell","buy-amount","sell-amount","amt",
    // "amt-value","time","box-simple-basic-info"],
    int q1 = text.indexOf('"');
    int q2 = text.lastIndexOf('"');
    List<String> arr = text.substring(q1 + 1, q2 - 1).split(',');
    return Futures(
      code: text.substring(text.lastIndexOf('_') + 1, q1 - 1),
      name: arr[0],
      open: double.parse(arr[2]), //
      high: double.parse(arr[3]),
      low: double.parse(arr[4]),
      prevClose: double.parse(arr[5]),
      ask: double.parse(arr[6]),
      bid: double.parse(arr[7]),
      latest: double.parse(arr[8]),
      settletment: double.parse(arr[9]),
      prevSettletment: double.parse(arr[10]),
      bidAmount: int.parse(arr[11]),
      askAmount: int.parse(arr[12]),
      totalVolume: double.parse(arr[13]),
      volume: double.parse(arr[14]),
      market: arr[15],
    );
  }
}
