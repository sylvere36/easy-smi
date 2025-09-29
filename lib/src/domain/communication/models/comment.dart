class CommentReactionCounts {
  final int like;
  final int good;
  final int love;
  final int bad;

  const CommentReactionCounts({
    required this.like,
    required this.good,
    required this.love,
    required this.bad,
  });

  factory CommentReactionCounts.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const CommentReactionCounts(like: 0, good: 0, love: 0, bad: 0);
    }
    return CommentReactionCounts(
      like: (json['like'] as num?)?.toInt() ?? 0,
      good: (json['good'] as num?)?.toInt() ?? 0,
      love: (json['love'] as num?)?.toInt() ?? 0,
      bad: (json['bad'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'like': like,
    'good': good,
    'love': love,
    'bad': bad,
  };
}

class CommentReadInfo {
  final int? id; // user id or read entry id depending on backend
  final String? name; // possible user name
  final String? readAt; // timestamp

  const CommentReadInfo({this.id, this.name, this.readAt});

  factory CommentReadInfo.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const CommentReadInfo();
    return CommentReadInfo(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      readAt: json['read_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'read_at': readAt};
}

class CommentItem {
  final int id;
  final int userId;
  final String body;
  final String? memo;
  final String? attachmentPath;
  final int organizationId;
  final String commentableType;
  final int commentableId;
  final int? parentId;
  final String createdAt;
  final String updatedAt;
  final String? userName;
  final int readsCount;
  final CommentReactionCounts reactionCounts;
  final CommentReactionCounts myReaction;
  final List<CommentItem> children;
  final String? attachmentUrl;
  final List<CommentReadInfo> reads;

  const CommentItem({
    required this.id,
    required this.userId,
    required this.body,
    required this.memo,
    required this.attachmentPath,
    required this.organizationId,
    required this.commentableType,
    required this.commentableId,
    required this.parentId,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.readsCount,
    required this.reactionCounts,
    required this.myReaction,
    required this.children,
    required this.attachmentUrl,
    required this.reads,
  });

  bool get hasAttachment =>
      attachmentPath != null && attachmentPath!.isNotEmpty;
  bool get hasChildren => children.isNotEmpty;
  bool get hasReactions =>
      reactionCounts.like +
          reactionCounts.good +
          reactionCounts.love +
          reactionCounts.bad >
      0;

  factory CommentItem.fromJson(Map<String, dynamic> json) {
    return CommentItem(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      body: (json['body'] ?? '') as String,
      memo: json['memo'] as String?,
      attachmentPath: json['attachment_path'] as String?,
      organizationId: (json['organization_id'] as num).toInt(),
      commentableType: (json['commentable_type'] ?? '') as String,
      commentableId: (json['commentable_id'] as num).toInt(),
      parentId: (json['parent_id'] as num?)?.toInt(),
      createdAt: (json['created_at'] ?? '') as String,
      updatedAt: (json['updated_at'] ?? '') as String,
      userName: json['user_name'] as String?,
      readsCount: (json['reads_count'] as num?)?.toInt() ?? 0,
      reactionCounts: CommentReactionCounts.fromJson(
        json['reaction_counts'] as Map<String, dynamic>?,
      ),
      myReaction: CommentReactionCounts.fromJson(
        json['my_reaction'] as Map<String, dynamic>?,
      ),
      children: (json['children'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(CommentItem.fromJson)
          .toList(),
      attachmentUrl: json['attachment_url'] as String?,
      reads: (json['reads'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(CommentReadInfo.fromJson)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'body': body,
    'memo': memo,
    'attachment_path': attachmentPath,
    'organization_id': organizationId,
    'commentable_type': commentableType,
    'commentable_id': commentableId,
    'parent_id': parentId,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'user_name': userName,
    'reads_count': readsCount,
    'reaction_counts': reactionCounts.toJson(),
    'my_reaction': myReaction.toJson(),
    'children': children.map((e) => e.toJson()).toList(),
    'attachment_url': attachmentUrl,
    'reads': reads.map((e) => e.toJson()).toList(),
  };

  String get humanReadableDate {
    try {
      final dateTime = DateTime.parse(createdAt).toLocal();
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inSeconds < 60) {
        return 'Il y a ${difference.inSeconds} secondes';
      } else if (difference.inMinutes < 60) {
        return 'Il y a ${difference.inMinutes} minutes';
      } else if (difference.inHours < 24) {
        return 'Il y a ${difference.inHours} heures';
      } else if (difference.inDays < 7) {
        return 'Il y a ${difference.inDays} jours';
      } else {
        return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
      }
    } catch (e) {
      return createdAt;
    }
  }
}
