
import 'Course.dart';

abstract class CourseHelper{
  static List<Course> getListfromJson(Map<dynamic, dynamic> json){
    List<Course> list=<Course>[];
    for (int x=0;x<json.length;x++){
      list.add(Course(
        courseId: json[x]["courseID"],
        courseName: json[x]["courseName"],
        courseImageUrl: json[x]["courseImageUrl"],
        courseDescription: json[x]["courseDescription"],
        courseTutor: json[x]["course_tutor"],
        coursePaymentStatus: json[x]["course_payment_status"],
        coursePaymentDetails: json[x]["coursePaymentDetails"],
        courseCredits: json[x]["courseCredits"],
        courseDate: DateTime.parse(json[x]["courseDate"]),
        courseZoomLink: json[x]["courseZoomLink"],
      ));
    }
    return list;
  }

}