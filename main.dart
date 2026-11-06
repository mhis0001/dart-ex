import 'dart:convert';

class Students {
  Students(this.people);

  final List<Map<String, String>> people;

  void sort(String field) {
    people.sort((first, second) {
      final firstValue = first[field] ?? '';
      final secondValue = second[field] ?? '';
      return firstValue.compareTo(secondValue);
    });
  }

  void output() {
    for (final person in people) {
      print(person);
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String field, String value) {
    people.removeWhere((person) => person[field] == value);
  }
}

void main() {
  const json = '''
[
  {"id": "84766fdf-9dc8-4b27-953f-a0756d48a2ba", "first": "Meryl", "last": "Streep", "email": "meryl.streep@gmail.com"},
  {"id": "ef18a663-721c-4905-8220-7d8458ddc644", "first": "Denzel", "last": "Washington", "email": "denzel.washington@gmail.com"},
  {"id": "2bd58d29-e4ce-443d-ac50-49bea0c7d968", "first": "Zendaya", "last": "Coleman", "email": "zendaya.coleman@gmail.com"},
  {"id": "90e8d858-284b-4d04-80ec-cae6e026ba88", "first": "Viola", "last": "Davis", "email": "viola.davis@gmail.com"},
  {"id": "5a64fc9e-b88f-4bf8-8b18-a84f7aed2bbc", "first": "Tom", "last": "Hanks", "email": "tom.hanks@gmail.com"},
  {"id": "8f4d3464-65b5-4a89-9405-a70c2d3fa76a", "first": "Keanu", "last": "Reeves", "email": "keanu.reeves@gmail.com"},
  {"id": "a53b9e72-5c11-4f4f-aec7-1e97d2a68b01", "first": "Emma", "last": "Stone", "email": "emma.stone@gmail.com"},
  {"id": "b64ca083-6d22-4050-bfd8-2fa8e3b79c12", "first": "Margot", "last": "Robbie", "email": "margot.robbie@gmail.com"},
  {"id": "c75db194-7e33-4161-c0e9-3ab9f4c80d23", "first": "Robert", "last": "Downey Jr.", "email": "robert.downey@gmail.com"}
]
''';

  final decodedPeople = jsonDecode(json) as List<dynamic>;
  final people = decodedPeople
      .map((person) => Map<String, String>.from(person as Map))
      .toList();
  final students = Students(people);

  print('Students sorted by first name:');
  students.sort('first');
  students.output();

  print('\nStudents sorted by last name:');
  students.sort('last');
  students.output();

  print('\nAdding a student:');
  students.plus({
    'id': '6d29a2c8-80cc-4b19-9b52-f01698bd8a42',
    'first': 'Ryan',
    'last': 'Gosling',
    'email': 'ryan.gosling@gmail.com',
  });
  students.output();

  print('\nRemoving the student with first name Tom:');
  students.remove('first', 'Tom');
  students.output();
}
