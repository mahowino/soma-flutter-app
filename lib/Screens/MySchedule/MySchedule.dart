import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Data/Courses/CourseApi.dart';
import '../Profile/Widget/profile_list_item.dart';
import '../SpecificCourse/SpecificCoursePage.dart';

class MyCourses extends StatefulWidget {

  const MyCourses({Key? key}) : super(key: key);


  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  late Future<List<dynamic>> courses;
  @override
  void initState() {
    super.initState();
    courses=CourseApi.getAvailableCourses();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Ongoing courses"),),
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
                            itemBuilder: (context, index) =>
                                _buildCourseItem(
                                  'assets/images/icons8_books_48px.png',
                                  snapshot.data?.elementAt(index).courseName,
                                  snapshot.data?.elementAt(index).courseDescription,),
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
  Widget _buildCourseItem(String imgPath, String courseName, String courseDescription ){
    return Padding(
      padding: EdgeInsets.only(left: 10.0,right: 10.0),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CourseViewer(imgPath,courseName,courseDescription,"12",
                "");
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
                Text("Engineering",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Engineering",
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
}
