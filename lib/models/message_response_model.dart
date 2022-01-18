/// status : true
/// status_code : 200
/// message : "Package/Order History"
/// data : {"current_page":1,"last_page":1,"total":1,"data":[{"id":1,"subject":"test","message":"this is testing"}]}

class MessageResponseModel {
  MessageResponseModel({
    bool? status,
    int? statusCode,
    String? message,
    MessageResponseData? data,
  }) {
    _status = status;
    _statusCode = statusCode;
    _message = message;
    _data = data;
  }

  MessageResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['status_code'];
    _message = json['message'];
    _data = json['data'] != null
        ? MessageResponseData.fromJson(json['data'])
        : null;
  }
  bool? _status;
  int? _statusCode;
  String? _message;
  MessageResponseData? _data;

  bool? get status => _status;
  int? get statusCode => _statusCode;
  String? get message => _message;
  MessageResponseData? get data => _data;

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
/// total : 1
/// data : [{"id":1,"subject":"test","message":"this is testing"}]

class MessageResponseData {
  MessageResponseData({
    int? currentPage,
    int? lastPage,
    int? total,
    List<MessageModel>? messages,
  }) {
    _currentPage = currentPage;
    _lastPage = lastPage;
    _total = total;
    _messages = messages;
  }

  MessageResponseData.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    _lastPage = json['last_page'];
    _total = json['total'];
    if (json['data'] != null) {
      _messages = [];
      json['data'].forEach((v) {
        _messages?.add(MessageModel.fromJson(v));
      });
    }
  }
  int? _currentPage;
  int? _lastPage;
  int? _total;
  List<MessageModel>? _messages;

  int? get currentPage => _currentPage;
  int? get lastPage => _lastPage;
  int? get total => _total;
  List<MessageModel>? get messages => _messages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    map['last_page'] = _lastPage;
    map['total'] = _total;
    if (_messages != null) {
      map['data'] = _messages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// subject : "test"
/// message : "this is testing"

class MessageModel {
  MessageModel({
    int? id,
    String? subject,
    String? message,
  }) {
    _id = id;
    _subject = subject;
    _message = message;
  }

  MessageModel.fromJson(dynamic json) {
    _id = json['id'];
    _subject = json['subject'];
    _message = json['message'];
  }
  int? _id;
  String? _subject;
  String? _message;

  int? get id => _id;
  String? get subject => _subject;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['subject'] = _subject;
    map['message'] = _message;
    return map;
  }
}
