// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadContentResponse _$ThreadContentResponseFromJson(
    Map<String, dynamic> json) {
  return ThreadContentResponse(
    threadId: json['thread_id'] as String,
    catId: json['cat_id'] as String,
    subCatId: json['sub_cat_id'] as String,
    title: json['title'] as String,
    userId: json['user_id'] as String,
    userNickname: json['user_nickname'] as String,
    userGender: _$enumDecode(_$GenderEnumMap, json['user_gender']),
    noOfReply: json['no_of_reply'] as String,
    noOfUniUserReply: json['no_of_uni_user_reply'] as String,
    likeCount: json['like_count'] as int,
    dislikeCount: json['dislike_count'] as int,
    replyLikeCount: json['reply_like_count'] as String,
    replyDislikeCount: json['reply_dislike_count'] as String,
    maxReplyLikeCount: json['max_reply_like_count'] as String,
    maxReplyDislikeCount: json['max_reply_dislike_count'] as String,
    createTime: json['create_time'] as int,
    lastReplyTime: const DateTimeStringSerialiser()
        .fromJson(json['last_reply_time'] as int),
    status: const DynamicStringSerialiser().fromJson(json['status']),
    isAdu: json['is_adu'] as bool,
    lastReplyUserId: json['last_reply_user_id'] as String,
    maxReply: json['max_reply'] as String,
    totalPage: json['total_page'] as int,
    isHot: json['is_hot'] as bool?,
    category: Category.fromJson(json['category'] as Map<String, dynamic>),
    displayVote: json['display_vote'] as bool,
    voteStatus: json['vote_status'] as String,
    isBookmarked: json['is_bookmarked'] as bool,
    isReplied: json['is_replied'] as bool,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    page: json['page'] as String,
    itemData: (json['item_data'] as List<dynamic>)
        .map((e) => Post.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ThreadContentResponseToJson(
        ThreadContentResponse instance) =>
    <String, dynamic>{
      'thread_id': instance.threadId,
      'cat_id': instance.catId,
      'sub_cat_id': instance.subCatId,
      'title': instance.title,
      'user_id': instance.userId,
      'user_nickname': instance.userNickname,
      'user_gender': _$GenderEnumMap[instance.userGender],
      'no_of_reply': instance.noOfReply,
      'no_of_uni_user_reply': instance.noOfUniUserReply,
      'like_count': instance.likeCount,
      'dislike_count': instance.dislikeCount,
      'reply_like_count': instance.replyLikeCount,
      'reply_dislike_count': instance.replyDislikeCount,
      'max_reply_like_count': instance.maxReplyLikeCount,
      'max_reply_dislike_count': instance.maxReplyDislikeCount,
      'create_time': instance.createTime,
      'last_reply_time':
          const DateTimeStringSerialiser().toJson(instance.lastReplyTime),
      'status': const DynamicStringSerialiser().toJson(instance.status),
      'is_adu': instance.isAdu,
      'last_reply_user_id': instance.lastReplyUserId,
      'max_reply': instance.maxReply,
      'total_page': instance.totalPage,
      'is_hot': instance.isHot,
      'category': instance.category,
      'display_vote': instance.displayVote,
      'vote_status': instance.voteStatus,
      'is_bookmarked': instance.isBookmarked,
      'is_replied': instance.isReplied,
      'user': instance.user,
      'page': instance.page,
      'item_data': instance.itemData,
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
