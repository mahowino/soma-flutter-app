import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_auth/Data/Courses/Course.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

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


  static Future<List<dynamic>> getAvailableCourses()async{
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

  static List getCoursesFromResponse(http.Response response) {
    final Map parsed = json.decode(response.body);
    List<dynamic> list = (parsed as List)
        .map((data) => new Course.fromJson(data))
        .toList();
    return list;

  }





}