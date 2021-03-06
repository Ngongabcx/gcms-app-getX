class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  dynamic phoneNo;
  String? email;
  String? address;
  dynamic image;
  String? dob;
  String? gender;
  int? hcp;
  String? dateJoined;
  String? aspnetusersId;
  Usertype? usertype;
  dynamic employmentDetails;
  dynamic membership;

  User(
      {required this.id,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.phoneNo,
      required this.email,
      required this.address,
      required this.image,
      required this.dob,
      required this.gender,
      required this.hcp,
      required this.dateJoined,
      required this.aspnetusersId,
      required this.usertype,
      required this.employmentDetails,
      required this.membership});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
    dob = json['dob'];
    gender = json['gender'];
    hcp = json['hcp'];
    dateJoined = json['dateJoined'];
    aspnetusersId = json['aspnetusersId'];
    usertype =
        json['usertype'] != null ? Usertype.fromJson(json['usertype']) : null;
    employmentDetails = json['employmentDetails'];
    membership = json['membership'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNo'] = phoneNo;
    data['email'] = email;
    data['address'] = address;
    data['image'] = image;
    data['dob'] = dob;
    data['gender'] = gender;
    data['hcp'] = hcp;
    data['dateJoined'] = dateJoined;
    data['aspnetusersId'] = aspnetusersId;
    if (usertype != null) {
      data['usertype'] = usertype!.toJson();
    }
    data['employmentDetails'] = employmentDetails;
    data['membership'] = membership;
    return data;
  }
}

class Usertype {
  int? id;
  String? name;
  String? description;

  Usertype({required this.id, required this.name, required this.description});

  Usertype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
