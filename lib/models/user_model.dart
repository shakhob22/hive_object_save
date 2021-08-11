class User{
  String? email;
  String? password;

  User({this.email, this.password});

  User.fromJson(Map<String, dynamic> json) ://
    email = json["email"],                  // toString
    password = json["password"];            //


  Map<String, dynamic> toJson() => {"email": email, "password": password}; // toMap

}

class Account{
  String? email;
  String? number;
  String? address;

  Account({this.email, this.number, this.address});

  Account.fromJson(Map<String, dynamic> json)
  : email = json["email"],
    number = json["number"],
    address = json["address"];

  Map<String, dynamic> toJson() => {
    "email": email,
    "number": number,
    "address": address
  };

}