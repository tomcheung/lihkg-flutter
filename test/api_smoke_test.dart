import 'package:flutter_test/flutter_test.dart';
import 'package:lihkg_flutter/core/lihkg_webservices.dart';

void main() {
  const config = LihkgWebServicesConfig(serverRoot: 'https://lihkg.com');
  final apiClient = LihkgWebServices(config);

  test('api fetch smoke test',  () async {
    final result = await apiClient.getSystemProperty();
    expect(result.categoryList.map((c) => c.name), contains('吹水台'));
  });
}