import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/MySchedule/MySchedule.dart';
import 'package:flutter_auth/Screens/SpecificCourse/SpecificCoursePage.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../Data/Providers/AuthProvider.dart';
import '../CourseForm/postCourse.dart';
import '../Mpesa/MpesaForm.dart';
import 'Widget/profile_list_item.dart';

class ProfilePage extends StatefulWidget {

  final email;
  const ProfilePage(this.email);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:kPrimaryColor,
        body: ListView(

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
                  widget.email,
                  style: kTitleTextStyle,
                ),
                SizedBox(height: kSpacingUnit * 0.5),

                Text(
                  Provider.of<AuthProvider>(context).user.credits.toString() + " credits",
                  style: kCaptionTextStyle,
                ),
                SizedBox(height: kSpacingUnit * 2),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Mpesa()),
                    );

                  },
                  child: Container(
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
                ),
              ],
            ),
          ),
          ),
            SizedBox(height: kSpacingUnit * 4),
            Column(
            children: <Widget>[

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyCourses(scheduled_route)),
                  );
                },
                child: const ProfileListItem(
                  icon: Icons.access_time_filled_outlined,
                  text: 'scheduled courses',
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoursePostForm(widget.email)),
                  );
                },
                child: const ProfileListItem(
                  icon: Icons.access_time_filled_outlined,
                  text: 'Offer course',
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyCourses(offered_courses_route)),
                  );
                },
                child: const ProfileListItem(
                  icon: Icons.access_time_filled_outlined,
                  text: 'offered courses',
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyCourses(completed_route)),
                  );
                },
                child: const ProfileListItem(
                  icon: Icons.access_time_filled_outlined,
                  text: 'Completed classes',
                ),
              ),
              GestureDetector(
                onTap: () async {

                  FlutterSecureStorage storage = FlutterSecureStorage();
                  storage.deleteAll();
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
                          Animation secondaryAnimation) {
                        return const MyApp();
                      }, transitionsBuilder: (BuildContext context, Animation<double> animation,
                          Animation<double> secondaryAnimation, Widget child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      }),
                          (Route route) => false);
                },
                child: const ProfileListItem(
                  icon: Icons.access_time_filled_outlined,
                  text: 'Logout',
                  hasNavigation: false,
                ),
              ),
            ],
          )
            ],
          ),
        ),
      );

  }
}
