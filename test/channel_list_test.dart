import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lihkg_flutter/core/lihkg_webservices.dart';
import 'package:lihkg_flutter/model/category.dart';
import 'package:lihkg_flutter/model/system_property.dart';
import 'package:lihkg_flutter/screen/root/drawer.dart';
import 'package:mocktail/mocktail.dart';
import 'mock.dart';

void main() {
  testWidgets('category list display', (tester) async {
    final mockWebServices = MockWebServices();
    final mockSystemProperty = SystemProperty(categoryList: [
      Category(catId: '1', name: 'Testing category 1', postable: true),
      Category(catId: '2', name: 'Testing category 2', postable: true),
    ]);
    when(mockWebServices.getSystemProperty).thenAnswer((_) => Future.value(mockSystemProperty));

    await tester.pumpWidget(ProviderScope(
      overrides: [
        lihkgWebServicesProvider.overrideWithValue(mockWebServices)
      ],
      child: const MaterialApp(home: AppDrawer()),
    ));

    await tester.pump(const Duration(seconds: 5));

    final listFinds = find.byType(CategoriesList);
    final textFinds = find.descendant(of: listFinds, matching: find.byType(Text));


    expect(textFinds.evaluate().length, 2);

    for (final (i, c) in mockSystemProperty.categoryList.indexed) {
      final firstFind = textFinds.at(i);
      Text text = tester.firstWidget(firstFind);
      expect(text.data, c.name);
    }
  });
}
