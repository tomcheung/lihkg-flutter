import 'package:freezed_annotation/freezed_annotation.dart';

class DynamicStringSerialiser implements JsonConverter<String?, dynamic> {
  const DynamicStringSerialiser();

  @override
  String? fromJson(json) {
    if (json is String) {
      return json;
    } else if (json is int) {
      return json.toString();
    } else {
      return null;
    }
  }

  @override
  toJson(String? object) {
    return object;
  }
}