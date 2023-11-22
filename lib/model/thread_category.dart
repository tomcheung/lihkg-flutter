import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lihkg_flutter/model/user.dart';
import 'package:lihkg_flutter/util/serialiser.dart';

import 'category.dart';

part 'thread_category.g.dart';

@JsonSerializable(createToJson: false)
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

@JsonSerializable(createToJson: false)
class ThreadCategoryItem {
  String threadId;
  int catId;
  int subCatId;
  String title;
  String userId;
  String userNickname;

  // Gender userGender;
  int noOfReply;
  int noOfUniUserReply;
  int likeCount;
  int dislikeCount;
  int replyLikeCount;
  int replyDislikeCount;
  int maxReplyLikeCount;
  int maxReplyDislikeCount;
  int createTime;
  @DateTimeStringSerialiser()
  DateTime lastReplyTime;
  int status;
  bool isAdu;

  // ResponseRemark remark;
  int lastReplyUserId;
  int maxReply;
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
