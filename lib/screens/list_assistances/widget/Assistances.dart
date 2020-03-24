import 'package:flutter/foundation.dart';

class Assistances {
  final int idAssistance;
  final int idAssistant;
  final String title;
  final int numberParticipants;
  final String location;
  final String description;
  final DateTime date;
  final int course;

  Assistances({
    @required this.idAssistance,
    @required this.idAssistant,
    @required this.title,
    @required this.numberParticipants,
    @required this.location,
    @required this.description,
    @required this.date,
    @required this.course,
  });

  int get assistanceId {
    return idAssistance;
  }

  int get assistantId => idAssistant;
  String get name => title;
  int get participants => numberParticipants;
  String get locate => location;
  String get descript => description;
  DateTime get dateAssistance => date;
  int get courses => course;
}
