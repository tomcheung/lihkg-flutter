// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThreadCategory _$ThreadCategoryFromJson(Map<String, dynamic> json) =>
    ThreadCategory(
      isPagination: json['is_pagination'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => ThreadCategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ThreadCategoryItem _$ThreadCategoryItemFromJson(Map<String, dynamic> json) =>
    ThreadCategoryItem(
      threadId: json['thread_id'] as String,
      catId: json['cat_id'] as int,
      subCatId: json['sub_cat_id'] as int,
      title: json['title'] as String,
      userId: json['user_id'] as String,
      userNickname: json['user_nickname'] as String,
      noOfReply: json['no_of_reply'] as int,
      noOfUniUserReply: json['no_of_uni_user_reply'] as int,
      likeCount: json['like_count'] as int,
      dislikeCount: json['dislike_count'] as int,
      replyLikeCount: json['reply_like_count'] as int,
      replyDislikeCount: json['reply_dislike_count'] as int,
      maxReplyLikeCount: json['max_reply_like_count'] as int,
      maxReplyDislikeCount: json['max_reply_dislike_count'] as int,
      createTime: json['create_time'] as int,
      lastReplyTime: const DateTimeStringSerialiser()
          .fromJson(json['last_reply_time'] as int),
      status: json['status'] as int,
      isAdu: json['is_adu'] as bool,
      lastReplyUserId: json['last_reply_user_id'] as int,
      maxReply: json['max_reply'] as int,
      totalPage: json['total_page'] as int,
      isHot: json['is_hot'] as bool,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      displayVote: json['display_vote'] as bool,
      voteStatus: json['vote_status'] as String,
      isBookmarked: json['is_bookmarked'] as bool,
      isReplied: json['is_replied'] as bool,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      page: json['page'] as String?,
    );
