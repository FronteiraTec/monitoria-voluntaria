import '../models/courseModel.dart';

class User {
  final int id;
  final String name;
  final String profileImage;
  final double stars;
  final String email;
  // final String phoneNumber;
  final bool verifiedAssistant;
  final double studentStars;
  final Course course;

  User({
    this.id,
    this.name,
    this.profileImage,
    this.stars,
    this.email,
    // this.phoneNumber,
    this.course,
    this.studentStars,
    this.verifiedAssistant,
  });

  static User parseFromMap(Map<String, dynamic> map){
    return User(
      name: map["fullName"],
      course: Course.parseFromMap(map["course"]),
      email: map["email"],
      id: map["id"],
      // phoneNumber: map["user_phone_number"],
      profileImage: "aksdjlja",
      stars: map["stars"].toDouble(),
      studentStars: -1,
      verifiedAssistant: map["verifiedAssistant"] == 1 ? true : false
    );
  }
}
