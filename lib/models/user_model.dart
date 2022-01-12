/// id : 7
/// name : "Alok Mishra"
/// phone : "9800000000"
/// email : "alok@abc.com"

class UserModel {
  UserModel({
    int? id,
    String? name,
    String? phone,
    String? email,
  }) {
    _id = id;
    _name = name;
    _phone = phone;
    _email = email;
  }

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
  }
  int? _id;
  String? _name;
  String? _phone;
  String? _email;

  int? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    return map;
  }
}
