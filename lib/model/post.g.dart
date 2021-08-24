// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    postId: json['post_id'] as String,
    quotePostId: json['quote_post_id'] as String?,
    threadId: json['thread_id'] as String,
    userNickname: json['user_nickname'] as String,
    userGender: _$enumDecode(_$GenderEnumMap, json['user_gender']),
    likeCount: json['like_count'] as String,
    dislikeCount: json['dislike_count'] as String,
    voteScore: json['vote_score'] as String?,
    noOfQuote:
        const StringToIntSerialiser().fromJson(json['no_of_quote'] as String),
    status: const DynamicStringSerialiser().fromJson(json['status']),
    replyTime:
        const DateTimeStringSerialiser().fromJson(json['reply_time'] as int),
    msgNum: json['msg_num'] as String,
    msg: json['msg'] as String,
    isMinimizedKeywords: json['is_minimized_keywords'] as bool?,
    page: json['page'] as int,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    displayVote: json['display_vote'] as bool?,
    lowQuality: json['low_quality'] as bool?,
    quote: json['quote'] == null
        ? null
        : PostQuote.fromJson(json['quote'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'post_id': instance.postId,
      'quote_post_id': instance.quotePostId,
      'thread_id': instance.threadId,
      'user_nickname': instance.userNickname,
      'user_gender': _$GenderEnumMap[instance.userGender],
      'like_count': instance.likeCount,
      'dislike_count': instance.dislikeCount,
      'vote_score': instance.voteScore,
      'no_of_quote': const StringToIntSerialiser().toJson(instance.noOfQuote),
      'status': const DynamicStringSerialiser().toJson(instance.status),
      'reply_time': const DateTimeStringSerialiser().toJson(instance.replyTime),
      'msg_num': instance.msgNum,
      'msg': instance.msg,
      'is_minimized_keywords': instance.isMinimizedKeywords,
      'page': instance.page,
      'user': instance.user,
      'display_vote': instance.displayVote,
      'low_quality': instance.lowQuality,
      'quote': instance.quote,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$GenderEnumMap = {
  Gender.M: 'M',
  Gender.F: 'F',
};

PostQuote _$PostQuoteFromJson(Map<String, dynamic> json) {
  return PostQuote(
    postId: json['post_id'] as String,
    threadId: json['thread_id'] as String,
    userNickname: json['user_nickname'] as String,
    userGender: _$enumDecode(_$GenderEnumMap, json['user_gender']),
    likeCount: json['like_count'] as String,
    dislikeCount: json['dislike_count'] as String,
    voteScore: json['vote_score'] as String,
    noOfQuote: json['no_of_quote'] as String,
    status: const DynamicStringSerialiser().fromJson(json['status']),
    replyTime: json['reply_time'] as int,
    msgNum: json['msg_num'] as String,
    msg: json['msg'] as String,
    isMinimizedKeywords: json['is_minimized_keywords'] as bool,
    page: json['page'] as int,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    displayVote: json['display_vote'] as bool,
    lowQuality: json['low_quality'] as bool,
  );
}

Map<String, dynamic> _$PostQuoteToJson(PostQuote instance) => <String, dynamic>{
      'post_id': instance.postId,
      'thread_id': instance.threadId,
      'user_nickname': instance.userNickname,
      'user_gender': _$GenderEnumMap[instance.userGender],
      'like_count': instance.likeCount,
      'dislike_count': instance.dislikeCount,
      'vote_score': instance.voteScore,
      'no_of_quote': instance.noOfQuote,
      'status': const DynamicStringSerialiser().toJson(instance.status),
      'reply_time': instance.replyTime,
      'msg_num': instance.msgNum,
      'msg': instance.msg,
      'is_minimized_keywords': instance.isMinimizedKeywords,
      'page': instance.page,
      'user': instance.user,
      'display_vote': instance.displayVote,
      'low_quality': instance.lowQuality,
    };
