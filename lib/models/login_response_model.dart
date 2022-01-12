/// status : true
/// status_code : 200
/// messagae : "Successfully, Registered!"
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOWRiYWU1ZjI4YTUyM2IwNDAxZDQ1OWQ2NjQ4NzhiMTcyMjdkOTZmY2ZiOGM2NDU0ZTJlOWZiZTUzOWUyYWJjMGZhNDAxMjViMzViZWNhZTMiLCJpYXQiOjE2NDA3NTg2NDYsIm5iZiI6MTY0MDc1ODY0NiwiZXhwIjoxNjcyMjk0NjQ2LCJzdWIiOiI3Iiwic2NvcGVzIjpbXX0.MtpR5x8BpYodGVbOROCNdkPTpW2n-8oTs44_D2u5myJNXik4f4XD4pOhB5BkHWnL9sR7bUm5c8N5vMvrwAEUTLXyf6sg9i3qQcLB0DJ8r81AcP4ZmuVnV8_GVsP6k8FO80RDa5_LRvEPNCldVz6zcaA8s192pm1gEVgB4cgn3qEtp4gQUQLrc3H8KIuIUC8RTziAglE3whv2WoSPRQFD_z9uAjoAicBYDf1KzockMIBwATIKRQonJ4yNsDabAir6LvZKCh97mLLyzpH0DEJ61k5IOZdMq0hfepk3Hwhy2DOro9sElgD_XlzduqbIht89_080KbQhiAmf6jjgz7cYfMx8KBfcNBjseShUwlxVffvz5fcGWlxubSkb-BVoeYgmtJCsj8JWJDG_wMSGntV3iG7TZlLmy-ylTU1osBgU_zigM4DiaUCyfo_Ho0IySvhEKj0duOnDzswceWGfrmdtnDetQngYYriFPxDSkxPkZwx5DeccG_rspF5Xw-AEOqxDDeIfoLf6nopbFtTowrfyMZL-oq7H_teVTu6d2nBmefrkHh4ILE298v5tXIdo9IzXuiJ-JHnm-DoiJm7awX18M140ory5p4-fP8Dja2tv9NSzAoTHdDMxIX4a2_fR9b8QFVv6Nwl_ZLbNUCew-1ofq85nKubRpiw72VgWdaqg3Pk"

class LoginResponseModel {
  LoginResponseModel({
    bool? status,
    int? statusCode,
    String? message,
    String? token,
  }) {
    _status = status;
    _statusCode = statusCode;
    _message = message;
    _token = token;
  }

  LoginResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['status_code'];
    _message = json['message'];
    _token = json['token'];
  }
  bool? _status;
  int? _statusCode;
  String? _message;
  String? _token;

  bool? get status => _status;
  int? get statusCode => _statusCode;
  String? get message => _message;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['status_code'] = _statusCode;
    map['message'] = _message;
    map['token'] = _token;
    return map;
  }
}
