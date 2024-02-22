import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/category.dart';
import '../model/quote.dart';
import '../model/system_property.dart';
import '../model/thread_content.dart';

part 'lihkg_webservices.g.dart';

enum PostOrder { replyTime, score }

extension PostOrderExtension on PostOrder {
  String get apiValue {
    switch (this) {
      case PostOrder.score:
        return 'score';
      case PostOrder.replyTime:
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

class LihkgWebServicesConfig {
  final String serverRoot;

  const LihkgWebServicesConfig({required this.serverRoot});

  static const defaultConfig =
      LihkgWebServicesConfig(serverRoot: 'https://lihkg.com');
  static const proxyConfig =
      LihkgWebServicesConfig(serverRoot: 'https://lihkg.www.vanportdev.com:8092');
}

class LihkgWebServices {
  final LihkgWebServicesConfig config;
  final String serverAPIRoot;

  late final Dio _dio;

  LihkgWebServices.mock(this.config, Dio dio)
      : serverAPIRoot = '${config.serverRoot}/api_v2',
        _dio = dio {
    _config();
  }

  LihkgWebServices(this.config)
      : serverAPIRoot = '${config.serverRoot}/api_v2' {

    _dio = Dio();
    _config();
  }

  _config() {
    final header = {
      'User-Agent': 'LIHKG/3.10 iOS/14.5 iPhone/iPhone13,4',
      'X-LI-DEVICE': '38735b3df9084f658a4fe7d8ab70bd1567c41035',
      'Accept': '*/*',
      'X-LI-DEVICE-TYPE': 'iPhone13,4',
      'Host': 'lihkg.com'
    };

    _dio.interceptors.add(LihkgHeaderInterceptor(header));

    if (kDebugMode) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  Future<SystemProperty> getSystemProperty() async {
    var response = await _dio.get("$serverAPIRoot/system/property");
    return SystemProperty.fromJson(response.data['response']);
  }

  Future<ThreadCategory> getThreadList(Category category,
      {int page = 1, int count = 30}) async {
    var uri = Uri.parse(config.serverRoot);
    uri = uri.replace(path: category.url?.path, queryParameters: {
      'cat_id': category.catId,
      'page': page.toString(),
      'count': count.toString(),
      'type': 'now'
    });

    final response = await _dio.getUri(uri);

    return ThreadCategory.fromJson(response.data['response']);
  }

  Future<ThreadContentResponse> getThreadContent({
    required String threadId,
    int page = 1,
    PostOrder order = PostOrder.replyTime,
  }) async {
    final response = await _dio.get(
      '$serverAPIRoot/thread/$threadId/page/$page',
      queryParameters: {'order': order.apiValue},
    );
    return ThreadContentResponse.fromJson(response.data['response']);
  }

  Future<QuoteResponse> getQuote({
    required String threadId,
    required String postId,
    int page = 1,
  }) async {
    var response = await _dio
        .get('$serverAPIRoot/thread/$threadId/$postId/quotes/page/$page');
    return QuoteResponse.fromJson(response.data['response']);
  }
}

@Riverpod(keepAlive: true)
LihkgWebServices lihkgWebServices(LihkgWebServicesRef ref) {
  if (kIsWeb) {
    return LihkgWebServices(LihkgWebServicesConfig.proxyConfig);
  } else {
    return LihkgWebServices(LihkgWebServicesConfig.defaultConfig);
  }
}
