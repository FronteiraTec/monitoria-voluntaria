class User {
  final int id;
  final String name;
  final String profileImage;
  final double stars;
  final String email;
  final String phoneNumber;
  final bool verifiedAssistant;
  final double studentStars;
  final int courseId;

  User({
    this.id,
    this.name,
    this.profileImage,
    this.stars,
    this.email,
    this.phoneNumber,
    this.courseId,
    this.studentStars,
    this.verifiedAssistant
  });

  static User parseFromMap(Map<String, dynamic> map){
    return User(
      name: map["user_full_name"],
      courseId: map["user_course_id"],
      email: map["user_email"],
      id: map["user_id"],
      phoneNumber: map["user_phone_number"],
      profileImage: "aksdjlja",
      stars: map["user_assistant_stars"].toDouble(),
      studentStars: -1,
      verifiedAssistant: map["user_verified_assistant"] == 1 ? true : false
    );
  }
}
