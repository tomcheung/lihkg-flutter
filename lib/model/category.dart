import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  String catId;
  String name;
  bool postable;
  Uri? url;

  // CategoryListQuery? query;

  // List<SubCategory> subCategory;

  Category({
    required this.catId,
    required this.name,
    required this.postable,
    this.url,
    // this.query,
    // this.subCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}