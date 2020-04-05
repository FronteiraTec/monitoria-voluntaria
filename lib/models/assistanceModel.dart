import "../models/userModel.dart";
import '../models/locationModel.dart';
import '../models/courseModel.dart';

class Assistance {
  final int id;
  final User owner;
  final String title;
  final Location location;
  final String description;
  final String createdAt;
  final DateTime date;
  final Course course;
  final int totalVacancies;
  final int avaliableVacancies;

  Assistance(
      {this.id,
      this.owner,
      this.title,
      this.location,
      this.description,
      this.date,
      this.createdAt,
      this.course,
      this.totalVacancies,
      this.avaliableVacancies
      // this.courseSpotlightImage
      });

  static Assistance parseFromMap(Map<String, dynamic> map) {
    return Assistance(
      date: DateTime.parse(map["date"]),
      id: map["id"],
      description: map["description"],
      location: Location.parseFromMap(map["address"]),
      owner: User.parseFromMap(map["owner"]),
      totalVacancies: map["total_vacancies"],
      avaliableVacancies: map["avaliable_vacancies"],
      title: map["title"],
      course: Course.parseFromMap(map["course"])
      // courseSpotlightImage: "http://131.108.55.50:3000/static/images/course_spotlight/${map['course_id']}.jpg",
      // course: Course.parseFromMap(map["course"]),
    );
  }
}
