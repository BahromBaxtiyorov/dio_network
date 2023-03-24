// import 'dart:convert';
//
// List<Datum> employeeFromJson(String str) => List<Datum>.from(json.decode(str).map((x) => Datum.fromJson(x)));
//
// String employeeToJson(List<Datum> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Datum {
//   Datum({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//   });
//
//   int userId;
//   int id;
//   String title;
//   String body;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     userId: json["userId"],
//     id: json["id"],
//     title: json["title"],
//     body: json["body"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "userId": userId,
//     "id": id,
//     "title": title,
//     "body": body,
//   };
// }

// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

List<PostModel> postModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
