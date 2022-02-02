/// status : false
/// status_code : 200
/// message : "Banner List"
/// data : [{"id":3,"title":"package info","permalink":"package-info","image":"https://logistics.intopros.com.np/uploads/banner/1639736763.jpg","description":"<p>new packages for customers</p>","link":"logistics.intopros.com.np","publish_date":"2021-12-17"}]

class BannerResponseModel {
  BannerResponseModel({
    bool? status,
    int? statusCode,
    String? message,
    List<BannerData>? banners,
  }) {
    _status = status;
    _statusCode = statusCode;
    _message = message;
    _banners = banners;
  }

  BannerResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['status_code'];
    _message = json['message'];
    if (json['data'] != null) {
      _banners = [];
      json['data'].forEach((v) {
        _banners?.add(BannerData.fromJson(v));
      });
    }
  }
  bool? _status;
  int? _statusCode;
  String? _message;
  List<BannerData>? _banners;

  bool? get status => _status;
  int? get statusCode => _statusCode;
  String? get message => _message;
  List<BannerData>? get banners => _banners;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['status_code'] = _statusCode;
    map['message'] = _message;
    if (_banners != null) {
      map['data'] = _banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 3
/// title : "package info"
/// permalink : "package-info"
/// image : "https://logistics.intopros.com.np/uploads/banner/1639736763.jpg"
/// description : "<p>new packages for customers</p>"
/// link : "logistics.intopros.com.np"
/// publish_date : "2021-12-17"

class BannerData {
  BannerData({
    int? id,
    String? title,
    String? permalink,
    String? image,
    String? description,
    String? link,
    String? publishDate,
  }) {
    _id = id;
    _title = title;
    _permalink = permalink;
    _image = image;
    _description = description;
    _link = link;
    _publishDate = publishDate;
  }

  BannerData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _permalink = json['permalink'];
    _image = json['image'];
    _description = json['description'];
    _link = json['link'];
    _publishDate = json['publish_date'];
  }
  int? _id;
  String? _title;
  String? _permalink;
  String? _image;
  String? _description;
  String? _link;
  String? _publishDate;

  int? get id => _id;
  String? get title => _title;
  String? get permalink => _permalink;
  String? get image => _image;
  String? get description => _description;
  String? get link => _link;
  String? get publishDate => _publishDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['permalink'] = _permalink;
    map['image'] = _image;
    map['description'] = _description;
    map['link'] = _link;
    map['publish_date'] = _publishDate;
    return map;
  }
}
