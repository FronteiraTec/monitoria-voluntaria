import "../models/userModel.dart";
import '../models/locationModel.dart';
import '../models/courseModel.dart';

class Assistance {
  final int id;
  final User owner;
  final String title;
  final int numberParticipants;
  final Location location;
  final String description;
  final String createdAt;
  final DateTime date;
  final Course course;
  // final String courseSpotlightImage;

  Assistance(
      {this.id,
      this.owner,
      this.title,
      this.numberParticipants,
      this.location,
      this.description,
      this.date,
      this.createdAt,
      this.course
      // this.courseSpotlightImage
      });

  static Assistance parseFromMap(Map<String, dynamic> map) {
    return Assistance(
      date: DateTime.parse(map["assistance_date"]),
      id: map["assistance_id"],
      description: map["assistance_description"],
      location: Location.parseFromMap(map),
      owner: User.parseFromMap(map),
      numberParticipants: map["assistance_num_participants"],
      title: map["assistance_title"],
      createdAt: map["assistance_created_at"],
      // courseSpotlightImage: "http://131.108.55.50:3000/static/images/course_spotlight/${map['course_id']}.jpg",
      course: Course.parseFromMap(map),
    );
  }
}
