import 'package:json_annotation/json_annotation.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/model/user.dart';
import 'package:lihkg_flutter/util/serialiser.dart';

import 'category.dart';
import 'gender.dart';

part 'thread_content.g.dart';

// @JsonSerializable()
// class ThreadContentRemark {
//   bool? isNotPushPost;
//
//   ThreadContentRemark({this.isNotPushPost});
//
//   factory ThreadContentRemark.fromJson(Map<String, dynamic> json) => _$ThreadContentRemarkFromJson(json);
// }

@JsonSerializable()
class ThreadContentResponse {
  String threadId;
  String catId;
  String subCatId;
  String title;
  String userId;
  String userNickname;
  Gender userGender;
  String noOfReply;
  String noOfUniUserReply;
  int likeCount;
  int dislikeCount;
  String replyLikeCount;
  String replyDislikeCount;
  String maxReplyLikeCount;
  String maxReplyDislikeCount;
  int createTime;
  @DateTimeStringSerialiser()
  DateTime lastReplyTime;
  @DynamicStringSerialiser()
  String? status;
  bool isAdu;
  // ResponseRemark remark;
  String lastReplyUserId;
  String maxReply;
  int totalPage;
  bool? isHot;
  Category category;
  bool displayVote;
  String voteStatus;
  bool isBookmarked;
  bool isReplied;
  User user;
  String page;
  List<Post> itemData;

  ThreadContentResponse({
    required this.threadId,
    required this.catId,
    required this.subCatId,
    required this.title,
    required this.userId,
    required this.userNickname,
    required this.userGender,
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
    this.status,
    required this.isAdu,
    // required this.remark,
    required this.lastReplyUserId,
    required this.maxReply,
    required this.totalPage,
    this.isHot,
    required this.category,
    required this.displayVote,
    required this.voteStatus,
    required this.isBookmarked,
    required this.isReplied,
    required this.user,
    required this.page,
    required this.itemData,
  });

  factory ThreadContentResponse.fromJson(Map<String, dynamic> json) =>
      _$ThreadContentResponseFromJson(json);
}
