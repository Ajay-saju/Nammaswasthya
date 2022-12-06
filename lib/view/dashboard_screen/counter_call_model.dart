class CounterCallingModel {
  String? status;
  List<Data>? data;

  CounterCallingModel({this.status, this.data});

  CounterCallingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? userCounter;
  String? userType;
  String? corporateCounter;
  String? corporateType;

  Data(
      {this.userCounter,
      this.userType,
      this.corporateCounter,
      this.corporateType});

  Data.fromJson(Map<String, dynamic> json) {
    userCounter = json['user_counter'];
    userType = json['user_type'];
    corporateCounter = json['corporate_counter'];
    corporateType = json['corporate_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_counter'] = this.userCounter;
    data['user_type'] = this.userType;
    data['corporate_counter'] = this.corporateCounter;
    data['corporate_type'] = this.corporateType;
    return data;
  }
}