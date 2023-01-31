import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key? key,
    this.icon=Icons.access_time_filled_outlined,
    this.text="hey",
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 4,
      ).copyWith(
        bottom: kSpacingUnit * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: kSpacingUnit * 2.5,
          ),
          SizedBox(width: kSpacingUnit * 1.5),
          Text(
            this.text,
            style: kTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              Icons.abc_rounded,
              size: kSpacingUnit * 2.5,
            ),
        ],
      ),
    );
  }
}