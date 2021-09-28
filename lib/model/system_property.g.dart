// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      json['cat_id'] as String,
      json['sub_cat_id'] as int,
      json['name'] as String,
      json['postable'] as bool,
      json['filterable'] as bool,
      json['orderable'] as bool,
      json['is_filter'] as bool,
      json['url'] as String,
    );

SystemProperty _$SystemPropertyFromJson(Map<String, dynamic> json) =>
    SystemProperty(
      categoryList: (json['category_list'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
