import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Profile/Widget/profile_list_item.dart';
import '../SpecificCourse/SpecificCoursePage.dart';

class MyCourses extends StatefulWidget {

  const MyCourses({Key? key}) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Ongoing courses"),),
      body: ListView(
        children: <Widget>[
          _buildCourseItem('assets/images/user_icon_male.png'),
          _buildCourseItem('assets/images/user_icon_male.png'),
          _buildCourseItem('assets/images/user_icon_male.png'),
          _buildCourseItem('assets/images/user_icon_male.png'),
          _buildCourseItem('assets/images/user_icon_male.png'),
          _buildCourseItem('assets/images/user_icon_male.png'),
          _buildCourseItem('assets/images/user_icon_male.png'),
        ],
      ),
    );
  }
  Widget _buildCourseItem(String imgPath, ){
    return Padding(
      padding: EdgeInsets.only(left: 10.0,right: 10.0),
      child: InkWell(
        onTap: (){
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
