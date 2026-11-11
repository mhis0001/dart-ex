import 'dart:convert';

import 'package:dart_students_exercise/data.dart';
import 'package:dart_students_exercise/students.dart';

void main() {
  String json = studentsJson;
  final decodedPeople = jsonDecode(json) as List<dynamic>;
  final people = decodedPeople
      .map((person) => Map<String, String>.from(person as Map))
      .toList();
  final students = Students(people);

  students.sort('first');
  students.output();

  students.sort('last');
  students.output();

  students.plus({
    'id': '6d29a2c8-80cc-4b19-9b52-f01698bd8a42',
    'first': 'Ryan',
    'last': 'Gosling',
    'email': 'ryan.gosling@gmail.com',
  });
  students.output();

  students.remove('first', 'Tom');
  students.output();
}
