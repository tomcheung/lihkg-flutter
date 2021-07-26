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
    lastReplyTime: json['last_reply_time'] as int,
    status: json['status'] as String,
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
        .map((e) =>
            ThreadContentResponseItemData.fromJson(e as Map<String, dynamic>))
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
      'last_reply_time': instance.lastReplyTime,
      'status': instance.status,
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

ThreadContentResponseItemData _$ThreadContentResponseItemDataFromJson(
    Map<String, dynamic> json) {
  return ThreadContentResponseItemData(
    postId: json['post_id'] as String,
    quotePostId: json['quote_post_id'] as String?,
    threadId: json['thread_id'] as String,
    userNickname: json['user_nickname'] as String,
    userGender: _$enumDecode(_$GenderEnumMap, json['user_gender']),
    likeCount: json['like_count'] as String,
    dislikeCount: json['dislike_count'] as String,
    voteScore: json['vote_score'] as String?,
    noOfQuote: json['no_of_quote'] as String?,
    remark: json['remark'],
    status: json['status'] as String?,
    replyTime: json['reply_time'] as int?,
    msgNum: json['msg_num'] as String,
    msg: json['msg'] as String,
    isMinimizedKeywords: json['is_minimized_keywords'] as bool?,
    page: json['page'] as int,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    displayVote: json['display_vote'] as bool?,
    lowQuality: json['low_quality'] as bool?,
  );
}

Map<String, dynamic> _$ThreadContentResponseItemDataToJson(
        ThreadContentResponseItemData instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'quote_post_id': instance.quotePostId,
      'thread_id': instance.threadId,
      'user_nickname': instance.userNickname,
      'user_gender': _$GenderEnumMap[instance.userGender],
      'like_count': instance.likeCount,
      'dislike_count': instance.dislikeCount,
      'vote_score': instance.voteScore,
      'no_of_quote': instance.noOfQuote,
      'remark': instance.remark,
      'status': instance.status,
      'reply_time': instance.replyTime,
      'msg_num': instance.msgNum,
      'msg': instance.msg,
      'is_minimized_keywords': instance.isMinimizedKeywords,
      'page': instance.page,
      'user': instance.user,
      'display_vote': instance.displayVote,
      'low_quality': instance.lowQuality,
    };
