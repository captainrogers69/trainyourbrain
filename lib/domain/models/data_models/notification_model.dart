import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String? title;
  final String? description;
  final bool? isRead;
  final bool? isDeleted;
  final Timestamp? firstReadAt;
  final Timestamp? lastReadAt;
  final Timestamp? sentAt;
  final Timestamp? recievedAt;
  final String? category;
  final String? source;
  final String? subCategory;
  final String? type;
  final String? url;
  NotificationModel({
    required this.title,
    required this.description,
    required this.isRead,
    required this.isDeleted,
    required this.firstReadAt,
    required this.lastReadAt,
    required this.sentAt,
    required this.recievedAt,
    required this.category,
    required this.source,
    required this.subCategory,
    required this.type,
    required this.url,
  });

  NotificationModel copyWith({
    String? title,
    String? description,
    bool? isRead,
    bool? isDeleted,
    Timestamp? firstReadAt,
    Timestamp? lastReadAt,
    Timestamp? sentAt,
    Timestamp? recievedAt,
    String? category,
    String? source,
    String? subCategory,
    String? type,
    String? url,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isRead: isRead ?? this.isRead,
      isDeleted: isDeleted ?? this.isDeleted,
      firstReadAt: firstReadAt ?? this.firstReadAt,
      lastReadAt: lastReadAt ?? this.lastReadAt,
      sentAt: sentAt ?? this.sentAt,
      recievedAt: recievedAt ?? this.recievedAt,
      category: category ?? this.category,
      source: source ?? this.source,
      subCategory: subCategory ?? this.subCategory,
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'isRead': isRead,
      'isDeleted': isDeleted,
      'firstReadAt': firstReadAt,
      'lastReadAt': lastReadAt,
      'sentAt': sentAt,
      'recievedAt': recievedAt,
      'category': category,
      'source': source,
      'subCategory': subCategory,
      'type': type,
      'url': url,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      isRead: map['isRead'] != null ? map['isRead'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      firstReadAt:
          map['firstReadAt'] != null ? map['firstReadAt'] as Timestamp : null,
      lastReadAt:
          map['lastReadAt'] != null ? map['lastReadAt'] as Timestamp : null,
      sentAt: map['sentAt'] != null ? map['sentAt'] as Timestamp : null,
      recievedAt:
          map['recievedAt'] != null ? map['recievedAt'] as Timestamp : null,
      category: map['category'] != null ? map['category'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
      subCategory:
          map['subCategory'] != null ? map['subCategory'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationModel(title: $title, description: $description, isRead: $isRead, isDeleted: $isDeleted, firstReadAt: $firstReadAt, lastReadAt: $lastReadAt, sentAt: $sentAt, recievedAt: $recievedAt, category: $category, source: $source, subCategory: $subCategory, type: $type, url: $url)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.isRead == isRead &&
        other.isDeleted == isDeleted &&
        other.firstReadAt == firstReadAt &&
        other.lastReadAt == lastReadAt &&
        other.sentAt == sentAt &&
        other.recievedAt == recievedAt &&
        other.category == category &&
        other.source == source &&
        other.subCategory == subCategory &&
        other.type == type &&
        other.url == url;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        isRead.hashCode ^
        isDeleted.hashCode ^
        firstReadAt.hashCode ^
        lastReadAt.hashCode ^
        sentAt.hashCode ^
        recievedAt.hashCode ^
        category.hashCode ^
        source.hashCode ^
        subCategory.hashCode ^
        type.hashCode ^
        url.hashCode;
  }
}
