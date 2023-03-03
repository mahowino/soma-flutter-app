import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_auth/Screens/CourseForm/DatePicker.dart';
import 'package:flutter_auth/Screens/MainPage/Components/CourseCards.dart';
import 'package:flutter_auth/components/background.dart';
import 'package:flutter_auth/constants.dart';

class CoursePostForm extends StatefulWidget {
final email;
  const CoursePostForm(this.email);

  @override
  State<CoursePostForm> createState() => _CoursePostFormState();
}

class _CoursePostFormState extends State<CoursePostForm> {
  TextEditingController courseNameController=TextEditingController();
  TextEditingController courseDescriptionController=TextEditingController();
  TextEditingController courseImageUrlController=TextEditingController();
  TextEditingController courseCreditsController=TextEditingController();
  TextEditingController courseZoomLinkController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Add course"),

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children:  <Widget>[
              SizedBox(height: 30,),
              ListTile(
                leading: Icon(Icons.book),
                title: TextField(
                  controller: courseNameController,
                  decoration: InputDecoration(
                    hintText: "Course name",
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ListTile(
                leading: const Icon(Icons.book),
                title: TextField(
                  controller: courseDescriptionController,
                  decoration: InputDecoration(
                    hintText: "Course description",
                  ),
                ),
              ),
              SizedBox(height:10,),
              ListTile(
                leading: const Icon(Icons.image),
                title: TextField(
                  controller: courseImageUrlController,
                  decoration: InputDecoration(
                    hintText: "course image url",
                  ),
                ),
              ),

              SizedBox(height: 10,),
              ListTile(
                leading: const Icon(Icons.money),
                title: TextField(
                  controller: courseCreditsController,
                  decoration: InputDecoration(

                    hintText: "course credits",
                  ),),),
              SizedBox(height: 10,),
              ListTile(
                leading: const Icon(Icons.money),
                title: TextField(
                  controller: courseZoomLinkController,
                  decoration: InputDecoration(

                    hintText: "course zoom link",
                  ),),),
              SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: () {


                      String? courseName=courseNameController.text.toString();
                      String? courseDescription=courseDescriptionController.text.toString();
                      String? courseImageUrl=courseImageUrlController.text.toString();
                      String? courseCredits=courseCreditsController.text.toString();
                      String? courseZoomLink=courseZoomLinkController.text.toString();


                      isCourseValid(courseName,courseDescription,courseImageUrl,courseCredits,courseZoomLink)?

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DatePicker(courseName,courseDescription,courseImageUrl,courseCredits,widget.email,courseZoomLink);
                          },

                        ),
                      ):
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Error posting course"),
                      ));
                    },
                    child: Text("Add course"),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  bool isCourseValid(String courseName, String courseDescription, String courseImageUrl, String courseCredits, String courseZoomLink)
  {
    if(!courseName.isEmpty &&!courseDescription.isEmpty &&!courseImageUrl.isEmpty &&!courseCredits.isEmpty &&!courseZoomLink.isEmpty )
      return true;
    else
      return false;
  }

}



