/// id : 1
/// name : "Document"
/// description : "Documents, paper,"

class PackageTypeModel {
  PackageTypeModel({
    int? id,
    String? name,
    String? description,
  }) {
    _id = id;
    _name = name;
    _description = description;
  }

  PackageTypeModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
  }
  int? _id;
  String? _name;
  String? _description;

  int? get id => _id;
  String? get name => _name;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    return map;
  }
}
