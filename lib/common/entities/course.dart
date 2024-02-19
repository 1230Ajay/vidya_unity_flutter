import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CourseRequestEntity {
  String? uid;

  CourseRequestEntity({
    this.uid,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
      };
}

class SearchRequestEntity {
  String? search;
  SearchRequestEntity({
    this.search,
  });

  Map<String, dynamic> toJson() => {
        "search": search,
      };
}

class CourseListResponseEntity {
  List<CourseItem>? data;
  int? status;

  CourseListResponseEntity({this.status, this.data});

  factory CourseListResponseEntity.fromJson(
          {required int status, required Map<String, dynamic> data}) =>
      CourseListResponseEntity(
          status: status,
          data: data["data"] == null
              ? []
              : List<CourseItem>.from(
                  data["data"].map((x) => CourseItem.fromJson(x)))
      );
}

//api post response msg


class AuthorRequestEntity {
  String? uid;

  AuthorRequestEntity({
    this.uid,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
      };
}

//api post response msg
class AuthorResponseEntity {
  int? code;
  AuthorItem? data;
  List<CourseItem>? courses;

  AuthorResponseEntity({
    this.code,
    this.data,
    this.courses
  });

  factory AuthorResponseEntity.fromJson({required Map<String, dynamic> data,required int status, required Map<String, dynamic> courses}) =>
      AuthorResponseEntity(
        code: status,
        data: AuthorItem.fromJson(data["data"]),
        courses: courses["courses"] == null
            ? []
            : List<CourseItem>.from(
            courses["courses"].map((x) => CourseItem.fromJson(x))),
      );
}

//fields = ['uid', 'email', 'phone', 'avatar', 'online',"description","first_name","last_name"]

// login result
class AuthorItem {
  String? uid;
  String? name;
  String? description;
  String? avatar;
  String? job;
  int? follow;
  int? score;
  int? download;
  bool? online;

  AuthorItem({
    this.uid,
    this.name,
    this.description,
    this.avatar,
    this.job,
    this.follow,
    this.score,
    this.download,
    this.online,
  });

  factory AuthorItem.fromJson(Map<String, dynamic> json) => AuthorItem(
        uid: json["uid"],
        name: '${json["first_name"]} ${json["last_name"]}',
        description: json["description"],
        avatar: json["avatar"],
        job: json["job"],
        follow: json["follow"],
        score: json["score"],
        download: json["download"],
        online: json["online"],
      );

  Map<String, dynamic> toJson() => {
        "token": uid,
        "name": name,
        "description": description,
        "avatar": avatar,
        "job": job,
        "follow": follow,
        "score": score,
        "download": download,
        "online": online,
      };
}

// login result
class CourseItem {
  String? image;
  String? uid;
  String? name;
  String? description;
  String? slug;
  String? institutes;
  double? price;
  double? rating;
  int? no_of_video;
  int? no_of_lessons;
  int? no_of_resourse;
  String? author;


  CourseItem(
      {this.image,
      this.uid,
      this.name,
      this.description,
      this.slug,
      this.institutes,
      this.price,
      this.rating,
      this.no_of_lessons,
      this.no_of_resourse,
      this.no_of_video,
        this.author
      });

  factory CourseItem.fromJson(Map<String, dynamic> data) => CourseItem(
        image: data["image"],
        uid: data["uid"],
        name: data["name"],
        description: data["description"],
        slug: data["slug"],
        price: data["price"],
        rating: data["rating"],
        institutes: data["institutes"][0]["uid"],
        no_of_lessons: data["no_of_lessons"],
        no_of_resourse: data["no_of_resourse"],
        no_of_video: data["no_of_video"],
        author: data["author"].toString()
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "uid": uid,
        "name": name,
        "description": description,
        "slug": slug,
        "price": price,
        "rating": rating,
        "institutes": institutes,
        "no_of_video": no_of_video,
        "no_of_resourse": no_of_resourse,
        "no_of_lessons": no_of_lessons,
      };
}


class CourseListDetailResponseEntity {
  List<CourseItem>? data;
  List<VideoItem>? videos;
  int? status;

  CourseListDetailResponseEntity({this.status, this.data,this.videos});

  factory CourseListDetailResponseEntity.fromJson(
      {required int status, required Map<String, dynamic> data, required Map<String, dynamic> videos}) =>
      CourseListDetailResponseEntity(
          status: status,
          videos: videos["videos"] == null
              ? []
              : List<VideoItem>.from(
              videos["videos"].map((x) => VideoItem.fromJson(x))),

          data: data["data"] == null
              ? []
              : List<CourseItem>.from(
              data["data"].map((x) => CourseItem.fromJson(x))),
      );
}


class VideoItem {
  String? uid;
  String? title;
  String? description;
  String? video_file;
  String? thumbnail;
  String? slug;
  String? course;

  VideoItem(
      {this.uid,
      this.title,
      this.description,
      this.video_file,
      this.thumbnail,
      this.slug,
      this.course});

  factory VideoItem.fromJson(Map<String, dynamic> data) => VideoItem(
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
