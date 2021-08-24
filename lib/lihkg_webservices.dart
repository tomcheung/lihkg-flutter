import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:cookie_jar/cookie_jar.dart';

import 'model/quote.dart';
import 'model/system_property.dart';
import 'model/thread_content.dart';

enum PostOrder { ReplyTime, Score }

extension PostOrderExtension on PostOrder {
  String get apiValue {
    switch (this) {
      case PostOrder.Score:
        return 'score';
      case PostOrder.ReplyTime:
        return 'reply_time';
    }
  }
}

class LihkgHeaderInterceptor extends Interceptor {
  final Map<String, String> _extraHeader;

  LihkgHeaderInterceptor(this._extraHeader);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(_extraHeader);
    handler.next(options);
  }
}

class LihkgWebServices {
  static const String serverAPIRoot = LihkgWebServices.serverRoot + "/api_v2";
  static const String serverRoot = "https://lihkg.com";
  static const Map<String, String> _header = {
    'User-Agent': 'LIHKG/3.10 iOS/14.5 iPhone/iPhone13,4',
    'X-LI-DEVICE': '38735b3df9084f658a4fe7d8ab70bd1567c41035',
    'Accept': '*/*',
    'X-LI-DEVICE-TYPE': 'iPhone13,4',
    'Host': 'lihkg.com'
  };

  static late Dio _dio = _getDio();

  static Dio _getDio() {
    var dio = Dio();
    var cookieJar = CookieJar();
    dio.interceptors.add(LihkgHeaderInterceptor(_header));
    dio.interceptors.add(CookieManager(cookieJar));

    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: false));
    }
    return dio;
  }

  Future<SystemProperty> getSystemProperty() async {
    var response = await _dio.get("$serverAPIRoot/system/property");
    return SystemProperty.fromJson(response.data['response']);
  }

  Future<ThreadCategory> getThreadCategory(
      {required String catId, int page = 1, int count = 30}) async {
    var response = await _dio.get("$serverAPIRoot/thread/category",
        queryParameters: {
          'cat_id': catId,
          'page': page,
          'count': count,
          'type': 'now'
        });

    return ThreadCategory.fromJson(response.data['response']);
  }

  Future<ThreadContentResponse> getThreadContent({
    required String threadId,
    int page = 1,
    PostOrder order = PostOrder.ReplyTime,
  }) async {
    var response = await _dio.get("$serverAPIRoot/thread/$threadId/page/$page",
        queryParameters: {'order': order.apiValue});
    return ThreadContentResponse.fromJson(response.data['response']);
  }

  Future<QuoteResponse> getQuote({
    required String threadId,
    required String postId,
    int page = 1,
  }) async {
    var response = await _dio.get('$serverAPIRoot/thread/$threadId/$postId/quotes/page/$page');
    return QuoteResponse.fromJson(response.data['response']);
  }
}
