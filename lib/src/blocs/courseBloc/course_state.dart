part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();
}

class CourseInitial extends CourseState {
  @override
  List<Object> get props => [];
}

class CourseDelivered extends CourseState {
  DocumentSnapshot documents;

  CourseDelivered({@required this.documents});

  @override
  List<Object> get props => null;
}

class CourseNotDelivered extends CourseState {
  String message;

  CourseNotDelivered({@required this.message});

  @override
  List<Object> get props => null;
}
