class Students {
  Students(this.people);

  final List<Map<String, String>> people;

  void sort(String field) {
    print('\nStudents sorted by $field:');
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
    print('\nAdding a student:');
    people.add(person);
  }

  void remove(String field, String value) {
    print('\nRemoving the student where $field is $value:');
    people.removeWhere((person) => person[field] == value);
  }
}
