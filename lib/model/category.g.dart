// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    catId: json['cat_id'] as String,
    name: json['name'] as String,
    postable: json['postable'] as bool,
    url: json['url'] == null ? null : Uri.parse(json['url'] as String),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'cat_id': instance.catId,
      'name': instance.name,
      'postable': instance.postable,
      'url': instance.url?.toString(),
    };
