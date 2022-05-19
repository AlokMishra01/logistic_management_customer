/// status : true
/// status_code : 200
/// message : "Package/Order History"
/// data : {"current_page":1,"last_page":1,"total":2,"data":[{"id":37,"sender_name":"Alok Mishra","sender_address":"Sankhamul, Kathamandu","sender_mobileno":9869050723,"sender_lat":"27.68264511","sender_lon":"85.33772528","reciever_name":"Akhilesh Mishra","reciever_address":"Lokanthali, Bhaktapur","reciever_mobileno":9869050723,"reciever_lat":"27.67451543","reciever_lon":"85.36968917","package_code":"9LPIWR25","package_type":"Parcel","package_weight":500,"package_size":1000000,"pickup_time":"10:00:00","dropoff_time":"17:00:00","fragile":true,"package_price":null,"express":true,"status":"Not Received"},{"id":34,"sender_name":"djs","sender_address":"jdskhf","sender_mobileno":8437546478,"sender_lat":"27.68829999","sender_lon":"27.68829999","reciever_name":"rrrrr","reciever_address":"rrr","reciever_mobileno":5555555555,"reciever_lat":"27.68829999","reciever_lon":"27.68829999","package_code":"XMFW0QY9","package_type":"Parcel","package_weight":12,"package_size":0,"pickup_time":"05:30:00","dropoff_time":"18:00:00","fragile":true,"package_price":"","express":true,"status":"Not Received"}]}

class PackageResponseModel {
  PackageResponseModel({
    bool? status,
    int? statusCode,
    String? message,
    PackageResponseData? data,
  }) {
    _status = status;
    _statusCode = statusCode;
    _message = message;
    _data = data;
  }

  PackageResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['status_code'];
    _message = json['message'];
    _data = json['data'] != null
        ? PackageResponseData.fromJson(json['data'])
        : null;
  }
  bool? _status;
  int? _statusCode;
  String? _message;
  PackageResponseData? _data;

  bool? get status => _status;
  int? get statusCode => _statusCode;
  String? get message => _message;
  PackageResponseData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['status_code'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// current_page : 1
/// last_page : 1
/// total : 2
/// data : [{"id":37,"sender_name":"Alok Mishra","sender_address":"Sankhamul, Kathamandu","sender_mobileno":9869050723,"sender_lat":"27.68264511","sender_lon":"85.33772528","reciever_name":"Akhilesh Mishra","reciever_address":"Lokanthali, Bhaktapur","reciever_mobileno":9869050723,"reciever_lat":"27.67451543","reciever_lon":"85.36968917","package_code":"9LPIWR25","package_type":"Parcel","package_weight":500,"package_size":1000000,"pickup_time":"10:00:00","dropoff_time":"17:00:00","fragile":true,"package_price":null,"express":true,"status":"Not Received"},{"id":34,"sender_name":"djs","sender_address":"jdskhf","sender_mobileno":8437546478,"sender_lat":"27.68829999","sender_lon":"27.68829999","reciever_name":"rrrrr","reciever_address":"rrr","reciever_mobileno":5555555555,"reciever_lat":"27.68829999","reciever_lon":"27.68829999","package_code":"XMFW0QY9","package_type":"Parcel","package_weight":12,"package_size":0,"pickup_time":"05:30:00","dropoff_time":"18:00:00","fragile":true,"package_price":"","express":true,"status":"Not Received"}]

class PackageResponseData {
  PackageResponseData({
    int? currentPage,
    int? lastPage,
    int? total,
    List<PackageModel>? data,
  }) {
    _currentPage = currentPage;
    _lastPage = lastPage;
    _total = total;
    _packages = data;
  }

  PackageResponseData.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    _lastPage = json['last_page'];
    _total = json['total'];
    if (json['data'] != null) {
      _packages = [];
      json['data'].forEach((v) {
        _packages?.add(PackageModel.fromJson(v));
      });
    }
  }
  int? _currentPage;
  int? _lastPage;
  int? _total;
  List<PackageModel>? _packages;

  int? get currentPage => _currentPage;
  int? get lastPage => _lastPage;
  int? get total => _total;
  List<PackageModel>? get packages => _packages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    map['last_page'] = _lastPage;
    map['total'] = _total;
    if (_packages != null) {
      map['data'] = _packages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 37
/// sender_name : "Alok Mishra"
/// sender_address : "Sankhamul, Kathamandu"
/// sender_mobileno : 9869050723
/// sender_lat : "27.68264511"
/// sender_lon : "85.33772528"
/// reciever_name : "Akhilesh Mishra"
/// reciever_address : "Lokanthali, Bhaktapur"
/// reciever_mobileno : 9869050723
/// reciever_lat : "27.67451543"
/// reciever_lon : "85.36968917"
/// package_code : "9LPIWR25"
/// package_type : "Parcel"
/// package_weight : 500
/// package_size : 1000000
/// pickup_time : "10:00:00"
/// dropoff_time : "17:00:00"
/// fragile : true
/// package_price : null
/// express : true
/// status : "Not Received"

class PackageModel {
  PackageModel({
    int? id,
    String? senderName,
    String? senderAddress,
    String? senderMobileno,
    String? senderLat,
    String? senderLon,
    String? recieverName,
    String? recieverAddress,
    String? recieverMobileno,
    String? recieverLat,
    String? recieverLon,
    String? packageCode,
    String? packageType,
    String? packageWeight,
    String? packageSize,
    String? pickupTime,
    String? dropoffTime,
    bool? fragile,
    String? packagePrice,
    bool? express,
    String? status,
  }) {
    _id = id;
    _senderName = senderName;
    _senderAddress = senderAddress;
    _senderMobileno = senderMobileno;
    _senderLat = senderLat;
    _senderLon = senderLon;
    _recieverName = recieverName;
    _recieverAddress = recieverAddress;
    _recieverMobileno = recieverMobileno;
    _recieverLat = recieverLat;
    _recieverLon = recieverLon;
    _packageCode = packageCode;
    _packageType = packageType;
    _packageWeight = packageWeight;
    _packageSize = packageSize;
    _pickupTime = pickupTime;
    _dropoffTime = dropoffTime;
    _fragile = fragile;
    _packagePrice = packagePrice;
    _express = express;
    _status = status;
  }

  PackageModel.fromJson(dynamic json) {
    _id = json['id'];
    _senderName = json['sender_name'];
    _senderAddress = json['sender_address'];
    _senderMobileno = (json['sender_mobileno'] ?? '').toString();
    _senderLat = json['sender_lat'];
    _senderLon = json['sender_lon'];
    _recieverName = json['reciever_name'];
    _recieverAddress = json['reciever_address'];
    _recieverMobileno = (json['reciever_mobileno'] ?? '').toString();
    _recieverLat = json['reciever_lat'];
    _recieverLon = json['reciever_lon'];
    _packageCode = json['package_code'];
    _packageType = json['package_type'];
    _packageWeight = (json['package_weight'] ?? '').toString();
    _packageSize = (json['package_size'] ?? '').toString();
    _pickupTime = json['pickup_time'];
    _dropoffTime = json['dropoff_time'];
    _fragile = json['fragile'];
    _packagePrice = (json['package_price'] ?? '').toString();
    _express = json['express'];
    _status = json['status'];
  }
  int? _id;
  String? _senderName;
  String? _senderAddress;
  String? _senderMobileno;
  String? _senderLat;
  String? _senderLon;
  String? _recieverName;
  String? _recieverAddress;
  String? _recieverMobileno;
  String? _recieverLat;
  String? _recieverLon;
  String? _packageCode;
  String? _packageType;
  String? _packageWeight;
  String? _packageSize;
  String? _pickupTime;
  String? _dropoffTime;
  bool? _fragile;
  String? _packagePrice;
  bool? _express;
  String? _status;

  int? get id => _id;
  String? get senderName => _senderName;
  String? get senderAddress => _senderAddress;
  String? get senderMobileno => _senderMobileno;
  String? get senderLat => _senderLat;
  String? get senderLon => _senderLon;
  String? get recieverName => _recieverName;
  String? get recieverAddress => _recieverAddress;
  String? get recieverMobileno => _recieverMobileno;
  String? get recieverLat => _recieverLat;
  String? get recieverLon => _recieverLon;
  String? get packageCode => _packageCode;
  String? get packageType => _packageType;
  String? get packageWeight => _packageWeight;
  String? get packageSize => _packageSize;
  String? get pickupTime => _pickupTime;
  String? get dropoffTime => _dropoffTime;
  bool? get fragile => _fragile;
  String? get packagePrice => _packagePrice;
  bool? get express => _express;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sender_name'] = _senderName;
    map['sender_address'] = _senderAddress;
    map['sender_mobileno'] = _senderMobileno;
    map['sender_lat'] = _senderLat;
    map['sender_lon'] = _senderLon;
    map['reciever_name'] = _recieverName;
    map['reciever_address'] = _recieverAddress;
    map['reciever_mobileno'] = _recieverMobileno;
    map['reciever_lat'] = _recieverLat;
    map['reciever_lon'] = _recieverLon;
    map['package_code'] = _packageCode;
    map['package_type'] = _packageType;
    map['package_weight'] = _packageWeight;
    map['package_size'] = _packageSize;
    map['pickup_time'] = _pickupTime;
    map['dropoff_time'] = _dropoffTime;
    map['fragile'] = _fragile;
    map['package_price'] = _packagePrice;
    map['express'] = _express;
    map['status'] = _status;
    return map;
  }
}
