import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

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
        child: Column(
          children: <Widget>[

          Container(
          height: kSpacingUnit * 10,
          width: kSpacingUnit * 100,
          margin: EdgeInsets.only(top: kSpacingUnit * 3),
          child: Center(
            child: Column(
              children: <Widget>[

                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [

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
        ),SizedBox(height: kSpacingUnit * 2),
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
        ), Expanded(
              child: ListView(
                children: <Widget>[
                  ProfileListItem(
                    icon: Icons.access_time_filled_outlined,
                    text: 'ongoing courses',
                  ),
                  ProfileListItem(
                    icon: Icons.access_time_filled_outlined,
                    text: 'Offer course',
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
