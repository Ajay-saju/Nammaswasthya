class UserDetailsModel {
  String? status;
  String? message;
  Data? data;

  UserDetailsModel({this.status, this.message, this.data});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? fullname;
  String? username;
  String? verified;
  String? profilePic;
  String? card;

  Data(
      {this.id,
      this.fullname,
      this.username,
      this.verified,
      this.profilePic,
      this.card});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    username = json['username'];
    verified = json['verified'];
    profilePic = json['profile_pic'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['username'] = this.username;
    data['verified'] = this.verified;
    data['profile_pic'] = this.profilePic;
    data['card'] = this.card;
    return data;
  }
}