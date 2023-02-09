import 'dart:ffi';


class Course{
  String? courseID,courseName,courseImageUrl,courseDescription,course_tutor,course_payment_status;
  Bool? coursePaymentDetails;
  int? courseCredits;
  DateTime? courseDate;

  Course(
      this.courseID,
      this.courseName,
      this.courseImageUrl,
      this.courseDescription,
      this.course_tutor,
      this.course_payment_status,
      this.coursePaymentDetails,
      this.courseCredits,
      this.courseDate);

  Course.fromJson(Map<String, dynamic> json)
      : courseName = json['n'],
        courseImageUrl = json['u'];

  Map<String, dynamic> toJson() {
    return {
      'n': courseName,
      'u': courseImageUrl,
    };
  }
}