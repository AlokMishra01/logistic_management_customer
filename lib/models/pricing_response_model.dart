class PricingResponseModel {
  PricingResponseModel({
    String? status,
    String? price,
    String? message,
  }) {
    _status = status;
    _price = price;
    _message = message;
  }

  PricingResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _price = json['price'];
    _message = json['message'];
  }
  String? _status;
  String? _price;
  String? _message;

  String? get status => _status;
  String? get price => _price;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['price'] = _price;
    map['message'] = _message;
    return map;
  }
}
