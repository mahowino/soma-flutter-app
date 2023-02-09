import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/MySchedule/MySchedule.dart';
import 'package:flutter_auth/Screens/SpecificCourse/SpecificCoursePage.dart';
import 'package:flutter_auth/constants.dart';

import '../CourseForm/postCourse.dart';
import 'Widget/profile_list_item.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Color(0xFF21BFBD),
        body: Column(
          children: <Widget>[
        Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            children: <Widget>[
            Container(
            margin: EdgeInsets.only(top: kSpacingUnit * 3),
            child: Center(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: kSpacingUnit * 5,
                          backgroundImage: AssetImage('assets/images/user_icon_male.png'),
                      ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),const SizedBox(height: 2.0),
              Text(
                'Nicolas Adams',
                style: kTitleTextStyle,
              ),
              SizedBox(height: kSpacingUnit * 0.5),
              Text(
                '2000 credits',
                style: kCaptionTextStyle,
              ),
              SizedBox(height: kSpacingUnit * 2),
              Container(
                height: kSpacingUnit * 4,
                width: kSpacingUnit * 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSpacingUnit * 3),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'Top Up Credits',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        ), Expanded(
              child: ListView(
                children: <Widget>[

                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyCourses()),
                      );
                    },
                    child: ProfileListItem(
                      icon: Icons.access_time_filled_outlined,
                      text: 'ongoing courses',
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoursePostForm()),
                      );
                    },
                    child: ProfileListItem(
                      icon: Icons.access_time_filled_outlined,
                      text: 'Offer course',
                    ),
                  ),
                  ProfileListItem(
                    icon: Icons.access_time_filled_outlined,
                    text: 'My schedule',
                  ),
                  ProfileListItem(
                    icon: Icons.access_time_filled_outlined,
                    text: 'Completed classes',
                  ),
                  ProfileListItem(
                    icon: Icons.access_time_filled_outlined,
                    text: 'Invite a Friend',
                  ),
                  ProfileListItem(
                    icon: Icons.access_time_filled_outlined,
                    text: 'Logout',
                    hasNavigation: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    );

  }
}
