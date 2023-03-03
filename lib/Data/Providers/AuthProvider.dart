import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/Data/User/User.dart';

class AuthProvider extends ChangeNotifier {
  User _user=User() ;

  AuthProvider();


  User get user => _user;

  set user(User value) {
    _user = value;
  }

  void chargeCredits(double credits){
    user.credits=(user.credits! - credits);
  }

  @override
  void updateUser(User user) {
    this._user=user;
  }

}