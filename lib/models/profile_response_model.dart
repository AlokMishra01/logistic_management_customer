import 'user_model.dart';

/// status : true
/// status_code : 200
/// message : "User Profile"
/// data : {"id":7,"name":"Alok Mishra","phone":"9800000000","email":"alok@abc.com"}

class ProfileResponseModel {
  ProfileResponseModel({
    bool? status,
    int? statusCode,
    String? message,
    UserModel? user,
  }) {
    _status = status;
    _statusCode = statusCode;
    _message = message;
    _user = user;
  }

  ProfileResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['status_code'];
    _message = json['message'];
    _user = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }
  bool? _status;
  int? _statusCode;
  String? _message;
  UserModel? _user;

  bool? get status => _status;
  int? get statusCode => _statusCode;
  String? get message => _message;
  UserModel? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['status_code'] = _statusCode;
    map['message'] = _message;
    if (_user != null) {
      map['data'] = _user?.toJson();
    }
    return map;
  }
}
