import 'package:flutter/material.dart';

class User {
  final String uuid;
  final String relation;
  final String name;
  final String gender;
  final int year;
  final int month;
  final int day;
  final int hour;
  final int min;
  final String meridiem;
  final String pob;
  User({
    required this.relation,
    required this.uuid,
    required this.name,
    required this.gender,
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.min,
    required this.meridiem,
    required this.pob,
  });
}
