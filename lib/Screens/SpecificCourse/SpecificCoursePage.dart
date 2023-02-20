import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../Profile/profile.dart';


class CourseViewer extends StatefulWidget {

   final heroTag;
   final courseName;
   final courseDescription;
   final courseCredits;
   final courseDates;


  CourseViewer( this.heroTag, this.courseName, this.courseDescription,this.courseCredits,this.courseDates);


  @override
  State<CourseViewer> createState() => _CourseViewerState();
}

class _CourseViewerState extends State<CourseViewer> {
  var selectedCard = 'WEIGHT';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Details',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.white)),
          centerTitle: true,

        ),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 82.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: Colors.transparent),
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 100.0,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width)),
            Positioned(
                top: 40.0,
                left: (MediaQuery
                    .of(context)
                    .size
                    .width / 2)-50,
                child: Hero(
                    tag: "image",
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.heroTag),
                                fit: BoxFit.cover)),
                        height: 100,
                        width: 100.0))
            ),
            Positioned(
                top: 150.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.courseName,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),

                    SizedBox(height: 20.0),
                    Container(
                        height: 220.00,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            _buildInfoCard(widget.courseDescription, widget.courseDescription,widget.courseDates),
                            SizedBox(height: 10.0),
                          //  _buildInfoCard('CALORIES', '267', 'CAL'),

                          ],
                        )
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: GestureDetector(
                        onTap: (){
                  },
                        child: Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius
                                  .circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(25.0),
                                  bottomRight: Radius.circular(25.0)),
                              color: Colors.black
                          ),
                          height: 50.0,
                          child: Center(
                            child: Text(
                                widget.courseCredits +"  total credits",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat'
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ])
        ]));

  }

  Widget _buildInfoCard(String cardTitle, String info, String courseDates) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kPrimaryColor,
              border: Border.all(
                  color:
                  Colors.transparent ,
                  style: BorderStyle.solid,
                  width: 0.75
              ),

            ),
            height: 100.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text("course Description",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: Colors.white,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: Colors.white,

                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 20.0),
                        Text(courseDates,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  )
                ]
            )
        )
    );
  }


  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }


}
