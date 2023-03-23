import 'package:freezed_annotation/freezed_annotation.dart';

class StringToIntSerialiser implements JsonConverter<int, String> {
  const StringToIntSerialiser();

  @override
  int fromJson(String json) {
    return int.parse(json);
  }

  @override
  String toJson(int object) {
    return object.toString();
  }

}