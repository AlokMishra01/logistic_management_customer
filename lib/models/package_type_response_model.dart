import 'package_type_model.dart';

class PackageTypeResponseModel {
  PackageTypeResponseModel({
    bool? status,
    int? statusCode,
    String? message,
    List<PackageTypeModel>? packages,
  }) {
    _status = status;
    _statusCode = statusCode;
    _message = message;
    _packages = packages;
  }

  PackageTypeResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['status_code'];
    _message = json['message'];
    if (json['data'] != null) {
      _packages = [];
      json['data'].forEach((v) {
        _packages?.add(PackageTypeModel.fromJson(v));
      });
    }
  }
  bool? _status;
  int? _statusCode;
  String? _message;
  List<PackageTypeModel>? _packages;

  bool? get status => _status;
  int? get statusCode => _statusCode;
  String? get message => _message;
  List<PackageTypeModel>? get packages => _packages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['status_code'] = _statusCode;
    map['message'] = _message;
    if (_packages != null) {
      map['data'] = _packages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
