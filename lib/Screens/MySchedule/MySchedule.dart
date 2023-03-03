import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Data/Providers/AuthProvider.dart';
import 'package:flutter_auth/constants.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Data/Courses/CourseApi.dart';
import '../Mpesa/MpesaForm.dart';
import '../Profile/Widget/profile_list_item.dart';
import '../SpecificCourse/SpecificCoursePage.dart';

class MyCourses extends StatefulWidget {

  final route;
  MyCourses(this.route);


  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  late Future<List<dynamic>> courses;
  @override
  void initState() {
    super.initState();



  }
  @override
  Widget build(BuildContext context) {
    if(widget.route==scheduled_route){
      String? userID=Provider.of<AuthProvider>(context).user.userID;
      courses=CourseApi.getScheduledCourses(userID!);
    }
    else if(widget.route==offered_courses_route){
      String? userID=Provider.of<AuthProvider>(context).user.userID;
      courses=CourseApi.getOngoingCourses(userID!);
    }
    else{
      String? userID=Provider.of<AuthProvider>(context).user.userID;
      courses=CourseApi.getCompletedCourses(userID!);
    }
    return  Scaffold(
      appBar: AppBar(title: Text("Courses"),),
      body: ListView(
        children: <Widget>[
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
                      return Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 16, 32),
                        child: ListView.builder(

                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>_buildCourseItem(
                            'assets/images/icons8_books_48px.png',
                            snapshot.data?.elementAt(index).courseId,
                            snapshot.data?.elementAt(index).courseTutor,
                            snapshot.data?.elementAt(index).courseName,
                            snapshot.data?.elementAt(index).courseDescription,
                            snapshot.data!.elementAt(index).courseCredits.toString(),
                            formattedDateTime(snapshot.data!.elementAt(index).courseDate),
                            context,),
                            itemCount: snapshot.data?.length),
                      );
                    }
                }
              }
          )


          /*_buildCourseItem('assets/images/user_icon_male.png',"","",),
          _buildCourseItem('assets/images/user_icon_male.png',"","",),
          _buildCourseItem('assets/images/user_icon_male.png',"","",),
          _buildCourseItem('assets/images/user_icon_male.png',"","",),
          _buildCourseItem('assets/images/user_icon_male.png',"","",),
          _buildCourseItem('assets/images/user_icon_male.png',"","",),
          _buildCourseItem('assets/images/user_icon_male.png',"","",),*/

        ],
      ),
    );
  }
  Widget _buildCourseItem(String imgPath,String ID, String tutor_ID, String courseName, String courseDescription,String courseCredits, String courseDates,BuildContext context ){
    return Padding(
      padding: EdgeInsets.only(left: 10.0,right: 10.0),
      child: InkWell(
        onTap: (){

          if(widget.route==scheduled_route){
            _launchURL();
          }
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
  _launchURL() async {
    const url = 'https://flutter.io';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
  String formattedDateTime(DateTime now){

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return formatted;
  }
}
