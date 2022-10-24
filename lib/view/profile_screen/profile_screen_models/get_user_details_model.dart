class GetUserProfileDetails {
  String? status;
  Data? data;

  GetUserProfileDetails({this.status, this.data});

  GetUserProfileDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? fullName;
  String? phoneNo;
  String? bloodGroup;
  String? profilePic;
  String? email;
  String? dob;
  String? gender;
  String? occupation;
  String? state;
  String? city;
  String? pincode;
  String? verified;

  Data(
      {this.id,
      this.fullName,
      this.phoneNo,
      this.bloodGroup,
      this.profilePic,
      this.email,
      this.dob,
      this.gender,
      this.occupation,
      this.state,
      this.city,
      this.pincode,
      this.verified});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneNo = json['phone_no'];
    bloodGroup = json['blood_group'];
    profilePic = json['profile_pic'];
    email = json['email'];
    dob = json['dob'];
    gender = json['gender'];
    occupation = json['occupation'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['phone_no'] = this.phoneNo;
    data['blood_group'] = this.bloodGroup;
    data['profile_pic'] = this.profilePic;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['occupation'] = this.occupation;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['verified'] = this.verified;
    return data;
  }
}
