import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Course {
  final int id;
  final String name;
  final String numberSemesters;
  final double description;
  Image image;

  Course({
    @required this.id,
    @required this.name,
    this.description,
    this.numberSemesters
  }) {
    image = Image.network('http://131.108.55.50:3000/static/images/course_spotlight/$id.jpg',
    fit: BoxFit.cover,
    );
  }

  static Course parseFromMap(Map<String, dynamic> map){
    return Course(
      id: map["course_id"],
      name: map["course_name"],
      description: map["course_description"],
    );
  }

  String get imageUrl {
    return "http://131.108.55.50:3000/static/images/course_spotlight/$id.jpg";
  }

  Image get imageWidget {
    return image;
  }

  void cacheImage(BuildContext context) {
    precacheImage(image.image, context);
  }

}
