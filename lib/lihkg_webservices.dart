import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lihkg_flutter/model/thread_category.dart';

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

class LihkgWebServices {
  static const String serverAPIRoot =
      LihkgWebServices.serverRoot + "/api_v2/";
  static const String serverRoot = "https://lihkg.com";
  static const Map<String, String> _header = {
    'User-Agent': 'LIHKG/3.10 iOS/14.5 iPhone/iPhone13,4',
    'X-LI-DEVICE': '38735b3df9084f658a4fe7d8ab70bd1567c41035',
    'Accept': '*/*',
    'X-LI-DEVICE-TYPE': 'iPhone13,4',
    'Host': 'lihkg.com'
  };

  Future<SystemProperty> getSystemProperty() async {
    final url = Uri.parse(serverAPIRoot + "system/property");
    var response = await http.get(url, headers: _header);
    var jsonResponse = jsonDecode(response.body);

    return SystemProperty.fromJson(jsonResponse['response']);
  }

  Future<ThreadCategory> getThreadCategory(
      {required String catId, int page = 1, int count = 30}) async {
    final url = Uri.parse(serverAPIRoot +
        "thread/category?cat_id=$catId&page=$page&count=$count&type=now");
    var response = await http.get(url, headers: _header);
    var jsonResponse = jsonDecode(response.body);

    return ThreadCategory.fromJson(jsonResponse['response']);
  }

  Future<ThreadContentResponse> getThreadContent({
    required String threadId,
    int page = 1,
    PostOrder order = PostOrder.ReplyTime,
  }) async {
    final url = Uri.parse(serverAPIRoot +
        "thread/$threadId/page/$page?order=${order.apiValue}");
    var response = await http.get(url, headers: _header);
    var jsonResponse = jsonDecode(response.body);

    return ThreadContentResponse.fromJson(jsonResponse['response']);
  }
}
