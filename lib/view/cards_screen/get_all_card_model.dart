class GetAllCards {
  String? status;
  List<Data>? data;

  GetAllCards({this.status, this.data});

  GetAllCards.fromJson(Map<String, dynamic> json) {
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
  String? cardType;
  String? cardCost;
  String? cardImage;

  Data({this.id, this.cardType, this.cardCost, this.cardImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardType = json['card_type'];
    cardCost = json['card_cost'];
    cardImage = json['card_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['card_type'] = this.cardType;
    data['card_cost'] = this.cardCost;
    data['card_image'] = this.cardImage;
    return data;
  }
}