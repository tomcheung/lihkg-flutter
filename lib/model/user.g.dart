// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['user_id'] as String,
      nickname: json['nickname'] as String,
      level: json['level'] as int,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      status: json['status'] as int,
      createTime: json['create_time'] as int?,
      isFollowing: json['is_following'] as bool,
      isBlocked: json['is_blocked'] as bool,
      isDisappear: json['is_disappear'] as bool,
      isNewbie: json['is_newbie'] as bool,
    );

const _$GenderEnumMap = {
  Gender.M: 'M',
  Gender.F: 'F',
};
