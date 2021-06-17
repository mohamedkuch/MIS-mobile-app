class Student {
  List<String> certificates;
  String sId;
  String firstName;
  String lastName;
  String tokenBase64;
  String rNumber;
  int iV;

  Student(
      {this.certificates,
      this.sId,
      this.firstName,
      this.lastName,
      this.tokenBase64,
      this.rNumber,
      this.iV});

  Student.fromJson(Map<String, dynamic> json) {
    certificates = json['certificates'].cast<String>();
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    tokenBase64 = json['tokenBase64'];
    rNumber = json['rNumber'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['certificates'] = this.certificates;
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['tokenBase64'] = this.tokenBase64;
    data['rNumber'] = this.rNumber;
    data['__v'] = this.iV;
    return data;
  }
}
