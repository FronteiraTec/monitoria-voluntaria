import 'package:flutter/foundation.dart';

class Assistances {
  final int idAssistance;
  final int idAssistant;
  final String assistanceName;
  final int numberParticipants;
  final String location;
  final String description;
  final String schedule;
  final int course;
  final int active;

  Assistances({
    @required this.idAssistance,
    @required this.idAssistant,
    @required this.assistanceName,
    @required this.numberParticipants,
    @required this.location,
    @required this.description,
    @required this.schedule,
    @required this.course,
    @required this.active,
  });

  int get assistanceId {
    return idAssistance;
  }

  int get assistantId => idAssistant;
  String get name => assistanceName;
  int get participants => numberParticipants;
  String get locate => location;
  String get descript => description;
  String get date => schedule;
  int get courses => course;
  int get actives => active;
}
