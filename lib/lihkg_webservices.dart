import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lihkg_flutter/model/thread_category.dart';

import 'model/system_property.dart';
import 'model/thread_content.dart';

enum PostOrder { ReplyTime, Score }

class LihkgWebServices {
  static const String serverAPIRoot =
      LihkgWebServices.serverRoot + "/api_v2/";
  static const String serverRoot = "https://lihkg.com";
  static const Map<String, String> _header = {
    'User-Agent': 'LIHKG/16.0.4 Android/9.0.0 Google/Pixel XL',
    'X-LI-DEVICE': 'Google/Pixel XL',
    'X-LI-DEVICE-TYPE': 'android',
    'referer': 'https://lihkg.com/category/5',
    'orginal': serverRoot
  };

  Future<SystemProperty> getSystemProperty() async {
    final url = Uri.parse(serverAPIRoot + "system/property");
    var response = await http.get(url, headers: _header);
    var jsonResponse = jsonDecode(response.body);

    return SystemProperty.fromJson(jsonResponse['response']);
  }

  Future<ThreadCategory> getThreadCategory(
      {required String catId, int page = 1, int count = 60}) async {
    final url = Uri.parse(serverAPIRoot +
        "thread/category?cat_id=$catId&page=$page&count=$count&type=now");
    var response = await http.get(url, headers: _header);
    var jsonResponse = jsonDecode(response.body);

    return ThreadCategory.fromJson(jsonResponse['response']);
  }

  Future<ThreadContentResponse> getThreadContent({
    required String threadId,
    int page = 1,
    PostOrder order = PostOrder.Score,
  }) async {
    final url = Uri.parse(serverAPIRoot +
        "thread/$threadId/page/$page?order=$order");
    var response = await http.get(url, headers: _header);
    var jsonResponse = jsonDecode(response.body);

    return ThreadContentResponse.fromJson(jsonResponse['response']);
  }
}
