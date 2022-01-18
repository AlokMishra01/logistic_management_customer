class UserModel {
  UserModel({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? city,
    String? street,
    String? province,
    String? district,
    String? country,
    String? image,
  }) {
    _id = id;
    _name = name;
    _phone = phone;
    _email = email;
    _city = city;
    _street = street;
    _province = province;
    _district = district;
    _country = country;
    _image = image;
  }

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _city = json['city'];
    _street = json['street'];
    _province = json['province'];
    _district = json['district'];
    _country = json['country'];
    _image = json['image'];
  }
  int? _id;
  String? _name;
  String? _phone;
  String? _email;
  String? _city;
  String? _street;
  String? _province;
  String? _district;
  String? _country;
  String? _image;

  int? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  String? get city => _city;
  String? get street => _street;
  String? get province => _province;
  String? get district => _district;
  String? get country => _country;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['city'] = _city;
    map['street'] = _street;
    map['province'] = _province;
    map['district'] = _district;
    map['country'] = _country;
    map['image'] = _image;
    return map;
  }
}
