import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../Profile/profile.dart';
import '../SpecificCourse/SpecificCoursePage.dart';

class MainPage extends StatefulWidget {

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();

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
            height: MediaQuery.of(context).size.height-145.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0,right: 25.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height-300,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("All courses"),
                        ),
                        SizedBox(height: 40.0),
                        _buildCourseItem('assets/images/user_icon_male.png'),
                        _buildCourseItem('assets/images/user_icon_male.png'),
                        _buildCourseItem('assets/images/user_icon_male.png'),
                        _buildCourseItem('assets/images/user_icon_male.png'),
                        _buildCourseItem('assets/images/user_icon_male.png'),
                        _buildCourseItem('assets/images/user_icon_male.png'),
                        _buildCourseItem('assets/images/user_icon_male.png'),
                      ],),),),
                SizedBox(height: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Container(
                      height: 65.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0,)
                      ),
                      child: Center(
                        child: Text("Search",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        )
                        ,),),

                    Container(
                      height: 65.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0,)
                      ),
                      child: Center(
                        child: Text("CheckOut",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),

                        ),
                        ),),

                  ],
                )
              ],
            ),
          ),
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
