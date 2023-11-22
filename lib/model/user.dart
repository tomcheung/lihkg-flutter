import 'package:freezed_annotation/freezed_annotation.dart';

import 'gender.dart';

part 'user.g.dart';

@JsonSerializable(createToJson: false)
class User {
  String userId;
  String nickname;
  int level;
  Gender gender;
  int status;
  int? createTime;
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
    this.createTime,
    // required this.levelName,
    required this.isFollowing,
    required this.isBlocked,
    required this.isDisappear,
    required this.isNewbie,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
