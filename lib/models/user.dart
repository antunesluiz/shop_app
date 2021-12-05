class User {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? token;
  String? error;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.token,
    this.error,
  });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    token = json['token'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['token'] = this.token;
    data['error'] = this.error;

    return data;
  }
}
