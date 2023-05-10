// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class EbookItem {
  final String? name;
  final String? description;
  final List? requirements;
  final List? whatYoullLearn;
  final String? language;
  final String? subtitle;
  final String? courseBy;
  final num? courseRating;
  final num? numofReviews;
  final bool? isBestSeller;
  final String? previewVideo;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final Map<String, dynamic>? intructorInfo;
  final Map<String, dynamic>? sectionsInfo;
  final bool? isCertificate;
  final bool? isLifetimeAcess;
  final num? assignments;
  final bool? supportFiles;
  final String? thumbnail;
  final List? imageUrls;
  final List? videoUrls;
  final String? previewLink;
  final String? bio;
  final String? category;
  final String? dPrice;
  final String? oPrice;
  final String? discount;
  EbookItem({
    this.name,
    this.description,
    this.requirements,
    this.whatYoullLearn,
    this.language,
    this.subtitle,
    this.courseBy,
    this.courseRating,
    this.numofReviews,
    this.isBestSeller,
    this.previewVideo,
    this.createdAt,
    this.updatedAt,
    this.intructorInfo,
    this.sectionsInfo,
    this.isCertificate,
    this.isLifetimeAcess,
    this.assignments,
    this.supportFiles,
    this.thumbnail,
    this.imageUrls,
    this.videoUrls,
    this.previewLink,
    this.bio,
    this.category,
    this.dPrice,
    this.oPrice,
    this.discount,
  });

  EbookItem copyWith({
    String? name,
    String? description,
    List? requirements,
    List? whatYoullLearn,
    String? language,
    String? subtitle,
    String? courseBy,
    num? courseRating,
    num? numofReviews,
    bool? isBestSeller,
    String? previewVideo,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    Map<String, dynamic>? intructorInfo,
    Map<String, dynamic>? sectionsInfo,
    bool? isCertificate,
    bool? isLifetimeAcess,
    num? assignments,
    bool? supportFiles,
    String? thumbnail,
    List? imageUrls,
    List? videoUrls,
    String? previewLink,
    String? bio,
    String? category,
    String? dPrice,
    String? oPrice,
    String? discount,
  }) {
    return EbookItem(
      name: name ?? this.name,
      description: description ?? this.description,
      requirements: requirements ?? this.requirements,
      whatYoullLearn: whatYoullLearn ?? this.whatYoullLearn,
      language: language ?? this.language,
      subtitle: subtitle ?? this.subtitle,
      courseBy: courseBy ?? this.courseBy,
      courseRating: courseRating ?? this.courseRating,
      numofReviews: numofReviews ?? this.numofReviews,
      isBestSeller: isBestSeller ?? this.isBestSeller,
      previewVideo: previewVideo ?? this.previewVideo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      intructorInfo: intructorInfo ?? this.intructorInfo,
      sectionsInfo: sectionsInfo ?? this.sectionsInfo,
      isCertificate: isCertificate ?? this.isCertificate,
      isLifetimeAcess: isLifetimeAcess ?? this.isLifetimeAcess,
      assignments: assignments ?? this.assignments,
      supportFiles: supportFiles ?? this.supportFiles,
      thumbnail: thumbnail ?? this.thumbnail,
      imageUrls: imageUrls ?? this.imageUrls,
      videoUrls: videoUrls ?? this.videoUrls,
      previewLink: previewLink ?? this.previewLink,
      bio: bio ?? this.bio,
      category: category ?? this.category,
      dPrice: dPrice ?? this.dPrice,
      oPrice: oPrice ?? this.oPrice,
      discount: discount ?? this.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'requirements': requirements?.toList(),
      'whatYoullLearn': whatYoullLearn?.toList(),
      'language': language,
      'subtitle': subtitle,
      'courseBy': courseBy,
      'courseRating': courseRating,
      'numofReviews': numofReviews,
      'isBestSeller': isBestSeller,
      'previewVideo': previewVideo,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'intructorInfo': intructorInfo,
      'sectionsInfo': sectionsInfo,
      'isCertificate': isCertificate,
      'isLifetimeAcess': isLifetimeAcess,
      'assignments': assignments,
      'supportFiles': supportFiles,
      'thumbnail': thumbnail,
      'imageUrls': imageUrls?.toList(),
      'videoUrls': videoUrls?.toList(),
      'previewLink': previewLink,
      'bio': bio,
      'category': category,
      'dPrice': dPrice,
      'oPrice': oPrice,
      'discount': discount,
    };
  }

  factory EbookItem.fromMap(Map<String, dynamic> map) {
    return EbookItem(
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      requirements: map['requirements'] != null
          ? List.from(map['requirements'] as List)
          : null,
      whatYoullLearn: map['whatYoullLearn'] != null
          ? List.from(map['whatYoullLearn'] as List)
          : null,
      language: map['language'] != null ? map['language'] as String : null,
      subtitle: map['subtitle'] != null ? map['subtitle'] as String : null,
      courseBy: map['courseBy'] != null ? map['courseBy'] as String : null,
      courseRating:
          map['courseRating'] != null ? map['courseRating'] as num : null,
      numofReviews:
          map['numofReviews'] != null ? map['numofReviews'] as num : null,
      isBestSeller:
          map['isBestSeller'] != null ? map['isBestSeller'] as bool : null,
      previewVideo:
          map['previewVideo'] != null ? map['previewVideo'] as String : null,
      createdAt:
          map['createdAt'] != null ? map['createdAt'] as Timestamp : null,
      updatedAt:
          map['updatedAt'] != null ? map['updatedAt'] as Timestamp : null,
      intructorInfo: map['intructorInfo'] != null
          ? Map<String, dynamic>.from(
              (map['intructorInfo'] as Map<String, dynamic>))
          : null,
      sectionsInfo: map['sectionsInfo'] != null
          ? Map<String, dynamic>.from(
              (map['sectionsInfo'] as Map<String, dynamic>))
          : null,
      isCertificate:
          map['isCertificate'] != null ? map['isCertificate'] as bool : null,
      isLifetimeAcess: map['isLifetimeAcess'] != null
          ? map['isLifetimeAcess'] as bool
          : null,
      assignments:
          map['assignments'] != null ? map['assignments'] as num : null,
      supportFiles:
          map['supportFiles'] != null ? map['supportFiles'] as bool : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      imageUrls:
          map['imageUrls'] != null ? List.from(map['imageUrls'] as List) : null,
      videoUrls:
          map['videoUrls'] != null ? List.from(map['videoUrls'] as List) : null,
      previewLink:
          map['previewLink'] != null ? map['previewLink'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      dPrice: map['dPrice'] != null ? map['dPrice'] as String : null,
      oPrice: map['oPrice'] != null ? map['oPrice'] as String : null,
      discount: map['discount'] != null ? map['discount'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EbookItem.fromJson(String source) =>
      EbookItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EbookItem(name: $name, description: $description, requirements: $requirements, whatYoullLearn: $whatYoullLearn, language: $language, subtitle: $subtitle, courseBy: $courseBy, courseRating: $courseRating, numofReviews: $numofReviews, isBestSeller: $isBestSeller, previewVideo: $previewVideo, createdAt: $createdAt, updatedAt: $updatedAt, intructorInfo: $intructorInfo, sectionsInfo: $sectionsInfo, isCertificate: $isCertificate, isLifetimeAcess: $isLifetimeAcess, assignments: $assignments, supportFiles: $supportFiles, thumbnail: $thumbnail, imageUrls: $imageUrls, videoUrls: $videoUrls, previewLink: $previewLink, bio: $bio, category: $category, dPrice: $dPrice, oPrice: $oPrice, discount: $discount)';
  }

  @override
  bool operator ==(covariant EbookItem other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.requirements == requirements &&
        other.whatYoullLearn == whatYoullLearn &&
        other.language == language &&
        other.subtitle == subtitle &&
        other.courseBy == courseBy &&
        other.courseRating == courseRating &&
        other.numofReviews == numofReviews &&
        other.isBestSeller == isBestSeller &&
        other.previewVideo == previewVideo &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        mapEquals(other.intructorInfo, intructorInfo) &&
        mapEquals(other.sectionsInfo, sectionsInfo) &&
        other.isCertificate == isCertificate &&
        other.isLifetimeAcess == isLifetimeAcess &&
        other.assignments == assignments &&
        other.supportFiles == supportFiles &&
        other.thumbnail == thumbnail &&
        other.imageUrls == imageUrls &&
        other.videoUrls == videoUrls &&
        other.previewLink == previewLink &&
        other.bio == bio &&
        other.category == category &&
        other.dPrice == dPrice &&
        other.oPrice == oPrice &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        requirements.hashCode ^
        whatYoullLearn.hashCode ^
        language.hashCode ^
        subtitle.hashCode ^
        courseBy.hashCode ^
        courseRating.hashCode ^
        numofReviews.hashCode ^
        isBestSeller.hashCode ^
        previewVideo.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        intructorInfo.hashCode ^
        sectionsInfo.hashCode ^
        isCertificate.hashCode ^
        isLifetimeAcess.hashCode ^
        assignments.hashCode ^
        supportFiles.hashCode ^
        thumbnail.hashCode ^
        imageUrls.hashCode ^
        videoUrls.hashCode ^
        previewLink.hashCode ^
        bio.hashCode ^
        category.hashCode ^
        dPrice.hashCode ^
        oPrice.hashCode ^
        discount.hashCode;
  }
}
