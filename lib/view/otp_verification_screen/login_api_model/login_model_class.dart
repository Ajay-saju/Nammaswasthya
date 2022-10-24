class UserLogin {
  String? status;
  String? message;
  Data? data;

  UserLogin({this.status, this.message, this.data});

  UserLogin.fromJson(Map<String, dynamic> json) {
    print('login model :${json['message']}');
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
  String? fullName;
  String? username;
  String? userEmail;
  String? password;
  String? bdate;
  String? age;
  String? profilePic;
  String? gender;
  String? phoneNo;
  String? bloodGroup;
  String? occupation;
  String? state;
  String? city;
  String? pincode;
  String? userBio;
  String? numPosts;
  String? numLikes;
  String? emailCode;
  String? verified;
  String? emailStatus;
  String? cardType;
  String? userType;
  String? userClosed;
  String? dateAdded;

  Data(
      {this.id,
      this.fullName,
      this.username,
      this.userEmail,
      this.password,
      this.bdate,
      this.age,
      this.profilePic,
      this.gender,
      this.phoneNo,
      this.bloodGroup,
      this.occupation,
      this.state,
      this.city,
      this.pincode,
      this.userBio,
      this.numPosts,
      this.numLikes,
      this.emailCode,
      this.verified,
      this.emailStatus,
      this.cardType,
      this.userType,
      this.userClosed,
      this.dateAdded});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    username = json['username'];
    userEmail = json['user_email'];
    password = json['password'];
    bdate = json['bdate'];
    age = json['age'];
    profilePic = json['profile_pic'];
    gender = json['gender'];
    phoneNo = json['phone_no'];
    bloodGroup = json['blood_group'];
    occupation = json['occupation'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
    userBio = json['user_bio'];
    numPosts = json['num_posts'];
    numLikes = json['num_likes'];
    emailCode = json['email_code'];
    verified = json['verified'];
    emailStatus = json['email_status'];
    cardType = json['card_type'];
    userType = json['user_type'];
    userClosed = json['user_closed'];
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['user_email'] = this.userEmail;
    data['password'] = this.password;
    data['bdate'] = this.bdate;
    data['age'] = this.age;
    data['profile_pic'] = this.profilePic;
    data['gender'] = this.gender;
    data['phone_no'] = this.phoneNo;
    data['blood_group'] = this.bloodGroup;
    data['occupation'] = this.occupation;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['user_bio'] = this.userBio;
    data['num_posts'] = this.numPosts;
    data['num_likes'] = this.numLikes;
    data['email_code'] = this.emailCode;
    data['verified'] = this.verified;
    data['email_status'] = this.emailStatus;
    data['card_type'] = this.cardType;
    data['user_type'] = this.userType;
    data['user_closed'] = this.userClosed;
    data['date_added'] = this.dateAdded;
    return data;
  }
}
