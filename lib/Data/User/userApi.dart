

import 'package:chopper/chopper.dart';

import 'User.dart';

part 'userApi.chopper.dart';

@ChopperApi(baseUrl: 'apo/v1/auth')
abstract class UserApiClass extends ChopperService{

  @Post(path: "/authenticate")
  Future<Response> loginUser(
      @Body() Map <String, dynamic> body,
      );



  @Post(path: "/register")
  Future<Response>? signUpUser(
      @Body() Map <String, dynamic> body,
      );

  static UserApiClass? create(){

    final client=ChopperClient(baseUrl: Uri.parse("https://soma.herokuapp.com/"),
        services: [
      _$UserApiClass()
    ],
    converter: JsonConverter()
    );

    return _$UserApiClass(client);
  }
}

