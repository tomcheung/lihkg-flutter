// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) {
  return SubCategory(
    json['cat_id'] as String,
    json['sub_cat_id'] as int,
    json['name'] as String,
    json['postable'] as bool,
    json['filterable'] as bool,
    json['orderable'] as bool,
    json['is_filter'] as bool,
    json['url'] as String,
  );
}

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'cat_id': instance.catId,
      'sub_cat_id': instance.subCatId,
      'name': instance.name,
      'postable': instance.postable,
      'filterable': instance.filterable,
      'orderable': instance.orderable,
      'is_filter': instance.isFilter,
      'url': instance.url,
    };

SystemProperty _$SystemPropertyFromJson(Map<String, dynamic> json) {
  return SystemProperty(
    categoryList: (json['category_list'] as List<dynamic>)
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SystemPropertyToJson(SystemProperty instance) =>
    <String, dynamic>{
      'category_list': instance.categoryList,
    };
