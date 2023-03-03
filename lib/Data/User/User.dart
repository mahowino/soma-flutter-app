class User {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? token;
  String? userID;
  double? credits;

  User.globalObject(
      this.email,
      this.token,
      this.userID,
      this.credits
      );

  User();

  User.fromJson(Map<String, dynamic> json)
      : firstname = json['firstname'],
        lastname = json['lastname'],
        email = json['email'],
        token=json['token'],
        userID=json['loginUID'],
        credits=json['credits'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
    };
  }
  Map<String, dynamic> toJsonLogIn() {
    return {
      'email': email,
      'password': password,
    };
  }

}