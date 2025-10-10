import 'dart:convert';

class NotificationItem {
  final int id;
  final String object;
  final String? htmlContent;
  final String? type;
  final int readByRecipient; // 0/1
  final bool isPriority;
  final String? scheduledAt; // ISO
  final String? senderName;
  final String? createdAt; // ISO

  const NotificationItem({
    required this.id,
    required this.object,
    this.htmlContent,
    this.type,
    required this.readByRecipient,
    required this.isPriority,
    this.scheduledAt,
    this.senderName,
    this.createdAt,
  });

  bool get isUnread => readByRecipient == 0;

  String get initials {
    final src = (senderName ?? object).trim();
    if (src.isEmpty) return 'N';
    final parts = src.split(RegExp(r'\s+'));
    if (parts.length == 1) {
      final p = parts.first;
      if (p.length == 1) return p.toUpperCase();
      return (p[0] + p[p.length - 1]).toUpperCase();
    }
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }

  String get humanDate {
    final raw = createdAt ?? scheduledAt;
    if (raw == null || raw.isEmpty) return '';
    try {
      final dt = DateTime.parse(raw).toLocal();
      final now = DateTime.now();
      final diff = now.difference(dt);
      if (diff.inSeconds < 60) return 'Il y a ${diff.inSeconds}s';
      if (diff.inMinutes < 60) return 'Il y a ${diff.inMinutes}m';
      if (diff.inHours < 24) return 'Il y a ${diff.inHours}h';
      if (diff.inDays < 7) return 'Il y a ${diff.inDays}j';
      return '${dt.day}/${dt.month}/${dt.year}';
    } catch (_) {
      return raw;
    }
  }

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: (json['id'] as num).toInt(),
      object: (json['object'] ?? json['title'] ?? '') as String,
      htmlContent:
          json['html_content'] as String? ?? json['content'] as String?,
      type: json['type'] as String?,
      readByRecipient:
          (json['read_by_recipient'] as num?)?.toInt() ??
          (json['is_read'] == true ? 1 : 0),
      isPriority:
          json['is_priority'] == true ||
          (json['priority'] as num?)?.toInt() == 1,
      scheduledAt: json['scheduled_at'] as String?,
      senderName: json['sender_name'] as String? ?? json['sender'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'object': object,
    'html_content': htmlContent,
    'type': type,
    'read_by_recipient': readByRecipient,
    'is_priority': isPriority,
    'scheduled_at': scheduledAt,
    'sender_name': senderName,
    'created_at': createdAt,
  };
}

class NotificationPageResult {
  final List<NotificationItem> items;
  final int total;
  final int perPage;
  final int currentPage;
  final int lastPage;
  final int unreadCount;

  const NotificationPageResult({
    required this.items,
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    required this.unreadCount,
  });

  factory NotificationPageResult.fromJson(dynamic raw) {
    // Accept either { data: [], meta: { pagination }, unread_count } or flat
    Map<String, dynamic>? json;
    if (raw is String) {
      try {
        json = (raw.isNotEmpty)
            ? (jsonDecode(raw) as Map<String, dynamic>)
            : {};
      } catch (_) {
        json = {};
      }
    } else if (raw is Map<String, dynamic>) {
      json = raw;
    }
    json ??= {};

    List<dynamic> list;
    int total = 0, perPage = 10, currentPage = 1, lastPage = 1, unread = 0;
    if (json.containsKey('data') && json['data'] is List) {
      list = json['data'] as List<dynamic>;
    } else if (json['notifications'] is List) {
      list = json['notifications'] as List<dynamic>;
    } else {
      list = (raw is List) ? raw : const [];
    }

    final meta = json['meta'] as Map<String, dynamic>?;
    final pagination = meta != null
        ? meta['pagination'] as Map<String, dynamic>?
        : null;
    total =
        (pagination?['total'] as num?)?.toInt() ??
        (json['total'] as num?)?.toInt() ??
        list.length;
    perPage =
        (pagination?['per_page'] as num?)?.toInt() ??
        (json['per_page'] as num?)?.toInt() ??
        10;
    currentPage =
        (pagination?['current_page'] as num?)?.toInt() ??
        (json['current_page'] as num?)?.toInt() ??
        1;
    lastPage =
        (pagination?['last_page'] as num?)?.toInt() ??
        (json['last_page'] as num?)?.toInt() ??
        1;

    unread = (json['unread_count'] as num?)?.toInt() ?? 0;

    final items = list
        .whereType<Map<String, dynamic>>()
        .map(NotificationItem.fromJson)
        .toList();

    return NotificationPageResult(
      items: items,
      total: total,
      perPage: perPage,
      currentPage: currentPage,
      lastPage: lastPage,
      unreadCount: unread,
    );
  }
}
