
import 'package:cloud_firestore/cloud_firestore.dart';



class LoginEntity{
  String? email;
  String? password;

  LoginEntity({this.password,this.email});

  Map<String,dynamic> toJson ()=> {
    "email":email,
    "password":password
  };
}




class VerifyResponseEntity{
  int? code;
  Map<String,dynamic>? data;

  VerifyResponseEntity({
    this.code,
    this.data,
  });

  factory VerifyResponseEntity.fromJson({required int code,required Map<String, dynamic> data}) =>
      VerifyResponseEntity(
        code: code,
        data: data,
      );
}


class RegisterEntity {
  String? first_name;
  String? last_name;
  String? email;
  String? password;


  RegisterEntity({
    this.first_name,
    this.last_name,
    this.email,
    this.password,

  });

  Map<String, dynamic> toJson() => {
    // "first_name": first_name,
    // "last_name": last_name,
    "email": email,
    "password":password,
  };
}

//api post response msg
class UserLoginResponseEntity {
  int? code;
  Map<String,dynamic>? data;

  UserLoginResponseEntity({
    this.code,
    this.data,
  });

  factory UserLoginResponseEntity.fromJson({required int code,required Map<String, dynamic> data}) =>
      UserLoginResponseEntity(
        code: code,
        data: data,
      );
}




// login result
class UserItem {
  String? uid;
  String? username;
  String? email;
  bool? is_institute_manager;
  bool? is_tutor;
  bool? is_student;
  String? avatar;
  bool? online;

  UserItem({
    this.uid,
    this.username,
    this.email,
    this.is_institute_manager,
    this.is_tutor,
    this.avatar,
    this.online,
    this.is_student,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) =>
      UserItem(
        uid: json["uid"],
        username: json["username"],
        email: json["email"],
        is_institute_manager: json["is_institute_manager"],
        is_student: json["is_student"],
        avatar: json["avatar"],
        online: json["online"],
        is_tutor: json["is_tutor"],
      );

  Map<String, dynamic> toJson() => {
    "uid":uid,
    "username": username,
    "email": email,
    "is_institute_manager": is_institute_manager,
    "is_student": is_student,
    "avatar": avatar,
    "online": online,
    "is_tutor": is_tutor,
  };
}

class UserData {
  final String? token;
  final String? name;
  final String? avatar;
  final String? description;
  final int? online;

  UserData({
    this.token,
    this.name,
    this.avatar,
    this.description,
    this.online,
  });

  factory UserData.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ){
    final data = snapshot.data();
    return UserData(
      token: data?['token'],
      name: data?['name'],
      avatar: data?['avatar'],
      description: data?['description'],
      online: data?['online'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (token != null) "token": token,
      if (name != null) "name": name,
      if (avatar != null) "avatar": avatar,
      if (description != null) "description": description,
      if (online != null) "online": online,
    };
  }
}


