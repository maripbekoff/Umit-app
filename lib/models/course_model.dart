class Course {
  String name;
  String description;
  List lessons;

  Course.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    description = data['description'];
    lessons = data['lessons'];
  }
}