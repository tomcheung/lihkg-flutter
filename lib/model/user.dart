
import 'package:json_annotation/json_annotation.dart';

import 'gender.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String userId;
  String nickname;
  String level;
  Gender gender;
  String status;
  int createTime;
  // LevelName levelName;
  bool isFollowing;
  bool isBlocked;
  bool isDisappear;
  bool isNewbie;

  User({
    required this.userId,
    required this.nickname,
    required this.level,
    required this.gender,
    required this.status,
    required this.createTime,
    // required this.levelName,
    required this.isFollowing,
    required this.isBlocked,
    required this.isDisappear,
    required this.isNewbie,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
