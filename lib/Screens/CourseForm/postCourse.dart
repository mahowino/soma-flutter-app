import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CourseForm/DatePicker.dart';

class CoursePostForm extends StatefulWidget {

  const CoursePostForm({Key? key}) : super(key: key);

  @override
  State<CoursePostForm> createState() => _CoursePostFormState();
}

class _CoursePostFormState extends State<CoursePostForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course information"),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.save), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DatePicker();
                },
              ),
            );
          })
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const <Widget>[
              SizedBox(height: 30,),
              ListTile(
                leading: Icon(Icons.person),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ListTile(
                leading: const Icon(Icons.phone),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Phone",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ListTile(
                leading: const Icon(Icons.email),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              const Divider(
                height: 1.0,
              ),
              SizedBox(height: 20,),
              ListTile(
                leading: const Icon(Icons.person),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ListTile(
                leading: const Icon(Icons.phone),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Phone",
                  ),
                ),
              ),
              SizedBox(height: 20,),

              ListTile(
                leading: const Icon(Icons.email),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  }



