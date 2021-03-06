import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'system_property.g.dart';

@JsonSerializable()
class SubCategory {
  String catId;
  int subCatId;
  String name;
  bool postable, filterable, orderable, isFilter;
  String url;

  SubCategory(
    this.catId,
    this.subCatId,
    this.name,
    this.postable,
    this.filterable,
    this.orderable,
    this.isFilter,
    this.url,
  );

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
}

@JsonSerializable()
class SystemProperty {
  List<Category> categoryList;

  SystemProperty({required this.categoryList});

  factory SystemProperty.fromJson(Map<String, dynamic> json) =>
      _$SystemPropertyFromJson(json);
}
