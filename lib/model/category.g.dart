// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      catId: json['cat_id'] as String,
      name: json['name'] as String,
      postable: json['postable'] as bool,
      url: json['url'] == null ? null : Uri.parse(json['url'] as String),
    );
