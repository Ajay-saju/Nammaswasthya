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
  String? id;
  String? counterNo;
  String? counterType;

  Data({this.id, this.counterNo, this.counterType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    counterNo = json['counter_no'];
    counterType = json['counter_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['counter_no'] = this.counterNo;
    data['counter_type'] = this.counterType;
    return data;
  }
}
