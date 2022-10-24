// To parse this JSON data, do
//
//     final homePageModelClass = homePageModelClassFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HomePageModelClass homePageModelClassFromJson(String str) => HomePageModelClass.fromJson(json.decode(str));

String homePageModelClassToJson(HomePageModelClass data) => json.encode(data.toJson());

class HomePageModelClass {
    HomePageModelClass({
        required this.status,
        required this.message,
        required this.data,
    });

    final String status;
    final String message;
    final Data data;

    factory HomePageModelClass.fromJson(Map<String, dynamic> json) => HomePageModelClass(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.fullname,
        required this.username,
        required this.verified,
        required this.profilePic,
        required this.card,
    });

    final String id;
    final String fullname;
    final String username;
    final String verified;
    final String profilePic;
    final String card;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullname: json["fullname"],
        username: json["username"],
        verified: json["verified"],
        profilePic: json["profile_pic"],
        card: json["card"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "verified": verified,
        "profile_pic": profilePic,
        "card": card,
    };
}
