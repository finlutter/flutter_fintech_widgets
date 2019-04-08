import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:meta/meta.dart';

import 'package:file_cache/file_cache.dart';

final String kUserAgent =
    "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) "
    "AppleWebKit/602.1.50 (KHTML, like Gecko) Mobile/14E5239e Safari/602.1";

Future<HttpClientResponse> loader(String url) async {
  NetworkEngine engine = await NetworkEngine.instance();
  return engine.get(url);
}

class NetworkEngine {
  NetworkEngine({
    @required this.httpClient,
    @required this.fileCache,
  });

  final HttpClient httpClient;
  final FileCache fileCache;

  static Future<NetworkEngine> _instance;

  static Future<NetworkEngine> instance() async {
    if (_instance == null) {
      final Completer<NetworkEngine> completer = Completer<NetworkEngine>();

      var httpClient = new HttpClient();
      httpClient.userAgent = kUserAgent;

      FileCache.fromDefault().then((dynamic fileCache) {
        completer.complete(
            NetworkEngine(httpClient: httpClient, fileCache: fileCache));
      }, onError: completer.completeError);

      _instance = completer.future;
    }
    return _instance;
  }

  Future<String> getWithCache(String url, {Encoding encoding: utf8}) async {
    Completer<String> completer = new Completer<String>();

    fileCache
        .getBytes(url, storeEncoding: encoding, forceCache: 100)
        .then((dynamic bytes) {
      completer.complete(encoding.decode(bytes));
    });
    return completer.future;
  }

  Future<HttpClientResponse> get(String url) async {
    final Uri uri = Uri.parse(url);

    var request = await httpClient.getUrl(uri);
    return await request.close();
  }

  Future<HttpClientResponse> post(String url, Map<String, dynamic> body) async {
    final Uri uri = Uri.parse(url);

    HttpClientRequest request = await httpClient.postUrl(uri);

    List<String> arr = <String>[];
    body.forEach((String key, dynamic val) {
      String sval = "$val";
      arr.add(
          "${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(sval)}");
    });
    String qs = arr.join('&');

    request.headers
      ..add(HttpHeaders.contentTypeHeader, 'application/x-www-form-urlencoded')
      ..add(HttpHeaders.contentLengthHeader, '${qs.length}');

    request.write(qs);
    return await request.close();
  }
}
