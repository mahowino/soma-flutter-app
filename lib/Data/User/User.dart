class User {
  String? firstname;
  String? lastname;
  String? email;
  String? password;

  User();

  User.fromJson(Map<String, dynamic> json)
      : firstname = json['firstname'],
        lastname = json['lastname'],
        email = json['email'],
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