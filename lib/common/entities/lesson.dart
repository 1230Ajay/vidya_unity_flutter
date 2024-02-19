
import 'package:cloud_firestore/cloud_firestore.dart';

class LessonRequestEntity {
  String? uid;

  LessonRequestEntity({
    this.uid,
  });

  Map<String, dynamic> toJson() => {
    "uid": uid,
  };

}


class LessonListResponseEntity {
  int? code;
  String? msg;
  List<LessonItem>? data;

  LessonListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory LessonListResponseEntity.fromJson(Map<String, dynamic> json) =>
      LessonListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<LessonItem>.from(json["data"].map((x) => LessonItem.fromJson(x))),
      );
}

//api post response msg
class LessonDetailResponseEntity {
  int? code;
  List<LessonVideoItem>? data;

  LessonDetailResponseEntity({
    this.code,
    this.data,
  });


  factory LessonDetailResponseEntity.fromJson(
      {required int code, required Map<String, dynamic> data}) =>
      LessonDetailResponseEntity(
        code: code,
        data: data["data"] == null ? [] : List<LessonVideoItem>.from(data["data"].map((x) => LessonVideoItem.fromJson(x))),
      );
}

class LessonItem {
  String? name;
  String? description;
  String? thumbnail;
  int? id;

  LessonItem({
    this.name,
    this.description,
    this.thumbnail,
    this.id,
  });

  factory LessonItem.fromJson(Map<String, dynamic> json) =>
      LessonItem(
        name: json["name"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "thumbnail": thumbnail,
    "id": id,
  };
}

class LessonVideoItem {
  String? uid;
  String? title;
  String? description;
  String? video_file;
  String? thumbnail;
  String? slug;
  String? course;

  LessonVideoItem(
      {this.uid,
        this.title,
        this.description,
        this.video_file,
        this.thumbnail,
        this.slug,
        this.course});

  factory LessonVideoItem.fromJson(Map<String, dynamic> data) => LessonVideoItem(
    uid: data["uid"],
    title: data["title"],
    description: data["description"],
    video_file: data["video_file"],
    thumbnail: data["thumbnail"],
    slug: data["slug"],
    course: data["course"],
  );

  Map<String, dynamic> toJson()=>{

  };


}

