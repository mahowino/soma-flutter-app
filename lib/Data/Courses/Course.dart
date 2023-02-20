import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());


class Course {
  Course({
    this.courseId,
    required this.courseName,
    required this.courseImageUrl,
    required this.courseDescription,
    this.courseTutor,
    this.coursePaymentStatus,
    required this.coursePaymentDetails,
    required this.courseCredits,
    required this.courseDate,
  });


  String? courseId;
  String courseName;
  String courseImageUrl;
  String courseDescription;
  dynamic courseTutor;
  dynamic coursePaymentStatus;
  bool coursePaymentDetails;
  int courseCredits;
  DateTime courseDate;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    courseId: json["courseID"],
    courseName: json["courseName"],
    courseImageUrl: json["courseImageUrl"],
    courseDescription: json["courseDescription"],
    courseTutor: json["course_tutor"],
    coursePaymentStatus: json["course_payment_status"],
    coursePaymentDetails: json["coursePaymentDetails"],
    courseCredits: json["courseCredits"],
    courseDate: DateTime.parse(json["courseDate"]),
  );

  Map<String, dynamic> toJson() => {
    "courseID": courseId,
    "courseName": courseName,
    "courseImageUrl": courseImageUrl,
    "courseDescription": courseDescription,
    "course_tutor": courseTutor,
    "course_payment_status": coursePaymentStatus,
    "coursePaymentDetails": coursePaymentDetails,
    "courseCredits": courseCredits,
    "courseDate": courseDate.toIso8601String(),
  };
}