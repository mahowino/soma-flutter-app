import 'dart:async';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Data/Courses/Course.dart';

import '../../Data/Courses/CourseApi.dart';
import '../../Data/User/User.dart';
import '../../Data/User/userApi.dart';
import '../../constants.dart';
import '../Profile/profile.dart';
import '../SpecificCourse/SpecificCoursePage.dart';

class MainPage extends StatefulWidget {

   MainPage({Key? key}) : super(key: key);



  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
late Future<List<dynamic>> courses;
late int lengthOfFile;


//inside initState method

  @override
  void initState()  {
    super.initState();
    courses=CourseApi.getAvailableCourses();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 15.0,left: 10.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 32,right: 16),
                        child: GestureDetector(
                          onTap: (){ Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProfilePage();
                              },
                            ),
                          );},
                          child: CircleAvatar(
                            radius: kSpacingUnit * 2.5,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('assets/images/user_icon_male.png',),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
              padding: EdgeInsets.only(left: 40.0),
          child: Row(
            children: <Widget>[
              Text("Soma",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(width: 10.0),
              Text("app",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
              ),

            ],
          ),
          ),
          SizedBox(height: 30.0,),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 25.0,right: 25.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("All courses"),
                        ),
                        SizedBox(height: 40.0),
                        FutureBuilder<List>(
                          future: courses,
                            builder:
                            (BuildContext context, AsyncSnapshot<List> snapshot){
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  return new Text('Waiting to load');
                                case ConnectionState.waiting:
                                  return new Text('Loading...');
                                default:
                                  if (snapshot.hasError) {
                                    return new Text('Error: ${snapshot.error}');
                                  } else {
                                    return Expanded(
                                      child: ListView.builder(

                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              _buildCourseItem('assets/images/user_icon_male.png',"hi","to you"),
                                          itemCount: snapshot.data!.length),
                                    );
                                  }
                              }
                            }
                        )

                       /* _buildCourseItem('assets/images/user_icon_male.png'),
                        _buildCourseItem('assets/images/user_icon_male.png'),
                        _buildCourseItem('assets/images/user_icon_male.png'),
                        _buildCourseItem('assets/images/user_icon_male.png'),
                        _buildCourseItem('assets/images/user_icon_male.png'),
                        _buildCourseItem('assets/images/user_icon_male.png'),*/
                      ],),),),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<dynamic> getAvailableCourses() async {
   var response= await CourseApi.getAvailableCourses();
   if(response==null){
     return null;
   }


  }
  Widget _buildCourseItem(String imgPath, String courseName, String courseDescription ){
    return Padding(
        padding: EdgeInsets.only(left: 10.0,right: 10.0),
      child: InkWell(
        onTap: (){
          signUp();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CourseViewer();
              },
            ),
          );
        },

        child: Row(
          children: [
            Hero(
                tag: imgPath,
                child: Image(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                  height: 75.0,
                  width: 75.0,
                )
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(courseName,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(courseDescription,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 40.0,),

              ],
            )
          ],
        ),
      ),
    );
  }
  static Future<String?> signUp() async {
    User user=User();
    user.firstname="jamo";
    user.lastname="msee";
    user.password="1234";
    user.email="jamoo@mama.com";
    final response= await UserApiClass.create()?.signUpUser(user.toJson());

    print(response!.body);
  }
}
