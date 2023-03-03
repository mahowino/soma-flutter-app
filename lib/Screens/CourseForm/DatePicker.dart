
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Data/Courses/Course.dart';
import 'package:flutter_auth/Data/Courses/CourseApi.dart';
import 'package:flutter_auth/Data/User/User.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Data/Providers/AuthProvider.dart';
import '../MainPage/Mainpage.dart';

class DatePicker extends StatefulWidget {

  final courseName;
  final courseDescription;
  final courseImageUrl;
  final courseCredits;
  final courseZoomLink;
  final email;

  DatePicker(this.courseName,this.courseDescription,this.courseImageUrl,this.courseCredits,this.email,this.courseZoomLink);
  
  @override
  _State createState() => _State();
}

class _State extends State<DatePicker> {

  String _value = '1/1/2022';
  String _selectedTime='00:00 hrs';
  DateTime picked=DateTime(2022);
  var isSelected=false;
  var isPosted=false;
  TimeOfDay result=TimeOfDay(hour: 00, minute: 00);



  Future _selectDate() async {
     picked = (await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2099)
    ))!;
    if(picked != null) {
      setState(() =>
    _value = picked.day.toString()+" "+picked.month.toString()+" "+picked.year.toString());
    }

  }


  // We don't need to pass a context to the _show() function
  // You can safety use context as below
  Future<void> _show() async {
    result =
    (await showTimePicker(context: context, initialTime: TimeOfDay.now()))!;
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select course date '),
          backgroundColor: kPrimaryColor,
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.save), onPressed: () {
              Dialogs.bottomMaterialDialog(
                  msg: 'Are you sure you want to post this course?',
                  title: 'Post course',
                  context: context,
                  actions: [
                    IconsOutlineButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      text: 'Cancel',
                      iconData: Icons.cancel_outlined,
                      textStyle: TextStyle(color: Colors.grey),
                      iconColor: Colors.grey,
                    ),
                    IconsButton(
                      onPressed: () {
                        setState(() {
                          isSelected=true;
                        });
                        String? tutorId=Provider.of<AuthProvider>(context).user.userID;
                        DateTime dateChosen=DateTime(picked.year,picked.month,picked.day,result.hour,result.minute,);
                        Course course=Course(
                            courseId: null,
                            courseName: widget.courseName,
                            courseImageUrl: widget.courseImageUrl,
                            courseDescription: widget.courseDescription,
                            courseTutor: tutorId,
                            coursePaymentStatus: false,
                            coursePaymentDetails: false,
                            courseCredits: int.parse(widget.courseCredits.toString()),
                            courseDate: dateChosen,
                        courseZoomLink: widget.courseZoomLink);
                        postCourse(course);

                      },
                      text: 'Post course',
                      iconData: Icons.save,
                      color: kPrimaryColor,
                      textStyle: TextStyle(color: Colors.white),
                      iconColor: Colors.white,
                    ),
                  ]);
            })
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(32.0),
            child: Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if(isSelected)
                LoadingAnimationWidget.dotsTriangle(
                  color: kPrimaryColor,

                  size: 100,
                ), SizedBox(height: 20,),
                    Text(_value),
                    Text(_selectedTime),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: _selectDate, child: Text('Choose date and time'),),
                    SizedBox(height: 20,),
                 ElevatedButton(
                    onPressed: _show, child: const Text('Show Time Picker')),
                  ],
                ),
              ),
            )
        ),

    );
  }
  void postCourse(dynamic course){
    var isSuccess=CourseApi.postCourse(course);
    if(isSuccess==true){
      setState(() {
        isSelected=false;
        isPosted=true;
      });

/*      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
           // User user=User.globalObject(email, token, userID, credits);
            //return MainPage(user);
          },

        ),
      );*/
    }

  }
}
