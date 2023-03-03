import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'User.dart';

abstract class UserClient{
 static var client=http.Client();
 static final storage=FlutterSecureStorage();
 static String signUpEndPoint="https://soma.herokuapp.com/apo/v1/auth/register";
 static String logInUserEndPoint="https://soma.herokuapp.com/apo/v1/auth/authenticate";

  static Future<User?> SignUpUser(dynamic object) async{

    Uri url=Uri.parse(signUpEndPoint);
    var _payload=json.encode(object);
    var _headers={
      'Content-Type':'application/json'
    };
    var response=await client.post(url,body: _payload,headers: _headers);

    if(response.statusCode==200){
      //store JWT Token to cache
      var responseDecode = jsonDecode(response.body);
      storeToken(responseDecode['token']);
      return getUserFromResponse(response) ;
    }

    else{
      print(response.statusCode);

  }
    return null;
  }

  static Future<User?> logInUser(dynamic object) async{
    Uri url=Uri.parse(logInUserEndPoint);
    var _payload=json.encode(object);
    var _headers={
      'Content-Type':'application/json'
    };
    var response=await client.post(url,body: _payload,headers: _headers);
    if(response.statusCode==200){
      //store JWT token to cache
      var responseDecode = jsonDecode(response.body);
      print(responseDecode);
      storeToken(responseDecode['token']);
      return getUserFromResponse(response) ;
    }
    else{
      print(response.statusCode);
      return null;

    }

  }

  static void storeToken(String token) async{
    return await storage.write(key: "token", value: token);
  }

 static User getUserFromResponse(http.Response response) {

    User? user=User.fromJson(jsonDecode(response.body));
    print(user.credits);
    print(user.userID);
    print(user.token);
    print(user.email);
    print(response.body);
   return new User.fromJson(jsonDecode(response.body));
 }


}

