class Employee_model {
  Employee_model({
      this.result,});

  Employee_model.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result.add(Result.fromJson(v));
      });
    }
  }
  List<Result> result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Result {
  Result({
      this.employeeId, 
      this.name, 
      this.address, 
      this.mobile, 
      this.organisation,});

  Result.fromJson(dynamic json) {
    employeeId = json['Employee_id'];
    name = json['Name'];
    address = json['Address'];
    mobile = json['Mobile'];
    organisation = json['Organisation'];
  }
  String employeeId;
  String name;
  String address;
  String mobile;
  String organisation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Employee_id'] = employeeId;
    map['Name'] = name;
    map['Address'] = address;
    map['Mobile'] = mobile;
    map['Organisation'] = organisation;
    return map;
  }

}