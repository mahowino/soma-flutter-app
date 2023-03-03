import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_auth/Data/Courses/Course.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'CourseHelper.dart';

abstract class CourseApi{
  static var client=http.Client();
  static var storage=FlutterSecureStorage();

  static String BaseUrl="https://soma.herokuapp.com";
  static String Mapping="/api/soma";

  static String availableCoursesEndPoint="/available";
  static String selectedCoursesEndPoint="/selected";
  static String scheduledCoursesEndPoint="/scheduled";
  static String completedCoursesEndPoint="/completed";
  static String ongoingCoursesEndPoint="/ongoing";
  static String postCoursesEndPoint="/post";
  static String scheduleCoursesEndPoint="/schedule";


  static Future<List> getAvailableCourses()async{
    Uri uri=Uri.parse("https://soma.herokuapp.com/api/soma/available");
    String? token = await storage.read(key: "token");
    print(token);
    var _headers={
      'Authorization':'Bearer $token',
      'Content-Type':'application/json',
    };
    print(token);
    var response=await client.get(uri,headers:_headers);

    if(response.statusCode==200){
      print(response.body);

      //decode to list of courses

      return getCoursesFromResponse(response);
    }
    else{
      print(response.statusCode);
      throw Future.error("error");
    }
  }

  static Future<List> getScheduledCourses()async{
    Uri uri=Uri.parse("https://soma.herokuapp.com/api/soma/scheduled");
    String? token = await storage.read(key: "token");
    print(token);
    var _headers={
      'Authorization':'Bearer $token',
      'Content-Type':'application/json',
    };
    print(token);
    var response=await client.get(uri,headers:_headers);

    if(response.statusCode==200){
      print(response.body);

      //decode to list of courses

      return getCoursesFromResponse(response);
    }
    else{
      print(response.statusCode);
      throw Future.error("error");
    }

  }
  static Future<List> getCompletedCourses()async{
    Uri uri=Uri.parse("https://soma.herokuapp.com/api/soma/completed");
    String? token = await storage.read(key: "token");
    print(token);
    var _headers={
      'Authorization':'Bearer $token',
      'Content-Type':'application/json',
    };
    print(token);
    var response=await client.get(uri,headers:_headers);

    if(response.statusCode==200){
      print(response.body);

      //decode to list of courses

      return getCoursesFromResponse(response);
    }
    else{
      print(response.statusCode);
      throw Future.error("error");
    }

  }
  static Future<List> getOngoingCourses()async{
    Uri uri=Uri.parse("https://soma.herokuapp.com/api/soma/ongoing");
    String? token = await storage.read(key: "token");
    print(token);
    var _headers={
      'Authorization':'Bearer $token',
      'Content-Type':'application/json',
    };
    print(token);
    var response=await client.get(uri,headers:_headers);

    if(response.statusCode==200){
      print(response.body);

      //decode to list of courses

      return getCoursesFromResponse(response);
    }
    else{
      print(response.statusCode);
      throw Future.error("error");
    }

  }
  static List getCoursesFromResponse(http.Response response) {
    List? list;
    var ddd=jsonDecode(response.body);
    list = (ddd as List)
        .map((data) => new Course.fromJson(data))
        .toList();

   return list;

  }

static Future<bool>? postCourse(dynamic object) async{
  Uri url=Uri.parse("https://soma.herokuapp.com/api/soma/post");
  var _payload=json.encode(object);
  String? token = await storage.read(key: "token");
  print(token);
  var _headers={
    'Authorization':'Bearer $token',
    'Content-Type':'application/json'
  };
  var response=await client.post(url,body: _payload,headers: _headers);
  if(response.statusCode==200){
    //store JWT token to cache
    return true;
  }
  else{
    print(response.statusCode);
    return false;

  }
}
  static Future<bool>? scheduleCourse(dynamic object, String userID) async{
    final queryParameters = {
      'userID': userID,
    };


    Uri url=Uri.https("soma.herokuapp.com","/api/soma/schedule",queryParameters);
    var _payload=json.encode(object);
    String? token = await storage.read(key: "token");
    print(token);
    var _headers={
      'Authorization':'Bearer $token',
      'Content-Type':'application/json'
    };
    var response=await client.post(url,body: _payload,headers: _headers);
    if(response.statusCode==200){
      //store JWT token to cache
      return true;
    }
    else{
      print(response.statusCode);
      return false;

    }
  }


}