// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VideoItem {
  final String? name;
  final String? description;
  final String? courseBy;
  final num? courseRating;
  final num? numofReviews;
  final String? previewVideo;
  VideoItem({
    this.name,
    this.description,
    this.courseBy,
    this.courseRating,
    this.numofReviews,
    this.previewVideo,
  });

  VideoItem copyWith({
    String? name,
    String? description,
    String? courseBy,
    num? courseRating,
    num? numofReviews,
    String? previewVideo,
  }) {
    return VideoItem(
      name: name ?? this.name,
      description: description ?? this.description,
      courseBy: courseBy ?? this.courseBy,
      courseRating: courseRating ?? this.courseRating,
      numofReviews: numofReviews ?? this.numofReviews,
      previewVideo: previewVideo ?? this.previewVideo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'courseBy': courseBy,
      'courseRating': courseRating,
      'numofReviews': numofReviews,
      'previewVideo': previewVideo,
    };
  }

  factory VideoItem.fromMap(Map<String, dynamic> map) {
    return VideoItem(
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      courseBy: map['courseBy'] != null ? map['courseBy'] as String : null,
      courseRating:
          map['courseRating'] != null ? map['courseRating'] as num : null,
      numofReviews:
          map['numofReviews'] != null ? map['numofReviews'] as num : null,
      previewVideo:
          map['previewVideo'] != null ? map['previewVideo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoItem.fromJson(String source) =>
      VideoItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VideoItem(name: $name, description: $description, courseBy: $courseBy, courseRating: $courseRating, numofReviews: $numofReviews, previewVideo: $previewVideo)';
  }

  @override
  bool operator ==(covariant VideoItem other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.courseBy == courseBy &&
        other.courseRating == courseRating &&
        other.numofReviews == numofReviews &&
        other.previewVideo == previewVideo;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        courseBy.hashCode ^
        courseRating.hashCode ^
        numofReviews.hashCode ^
        previewVideo.hashCode;
  }
}
