// import 'package:cloud_firestore/cloud_firestore.dart';

// class CourseRepository {
//   Firestore firestore;

//   CourseRepository() {
//     this.firestore = Firestore.instance;
//   }

//   Future<DocumentSnapshot> getCourse() async {
//     QuerySnapshot course = await firestore.collection('Courses').getDocuments();

//     List _courses = [];

//     // course.documents.forEach((document) {
//     //   Course course = Course.fromMap(document.data);
//     //   _courses.add(course);
//     // });
//   }
// }
