import 'package:json_annotation/json_annotation.dart';
import 'package:lihkg_flutter/model/user.dart';

import 'category.dart';

part 'thread_category.g.dart';

@JsonSerializable()
class ThreadCategory {
  bool isPagination;
  List<ThreadCategoryItem> items;

  ThreadCategory({
    required this.isPagination,
    required this.items,
  });

  factory ThreadCategory.fromJson(Map<String, dynamic> json) =>
      _$ThreadCategoryFromJson(json);
}

@JsonSerializable()
class ThreadCategoryItem {
  String threadId;
  String catId;
  String subCatId;
  String title;
  String userId;
  String userNickname;

  // Gender userGender;
  String noOfReply;
  String noOfUniUserReply;
  int likeCount;
  int dislikeCount;
  String replyLikeCount;
  String replyDislikeCount;
  String maxReplyLikeCount;
  String maxReplyDislikeCount;
  int createTime;
  int lastReplyTime;
  String status;
  bool isAdu;

  // ResponseRemark remark;
  String lastReplyUserId;
  String maxReply;
  int totalPage;
  bool isHot;
  Category category;
  bool displayVote;
  String voteStatus;
  bool isBookmarked;
  bool isReplied;
  User user;
  // PinnedPost pinnedPost;
  String? page;

  ThreadCategoryItem({
    required this.threadId,
    required this.catId,
    required this.subCatId,
    required this.title,
    required this.userId,
    required this.userNickname,
    required this.noOfReply,
    required this.noOfUniUserReply,
    required this.likeCount,
    required this.dislikeCount,
    required this.replyLikeCount,
    required this.replyDislikeCount,
    required this.maxReplyLikeCount,
    required this.maxReplyDislikeCount,
    required this.createTime,
    required this.lastReplyTime,
    required this.status,
    required this.isAdu,
    // required this.remark,
    required this.lastReplyUserId,
    required this.maxReply,
    required this.totalPage,
    required this.isHot,
    required this.category,
    required this.displayVote,
    required this.voteStatus,
    required this.isBookmarked,
    required this.isReplied,
    required this.user,
    // required this.pinnedPost,
    this.page,
  });
// List<ItemDatum> itemData;

  factory ThreadCategoryItem.fromJson(Map<String, dynamic> json) =>
      _$ThreadCategoryItemFromJson(json);
}
