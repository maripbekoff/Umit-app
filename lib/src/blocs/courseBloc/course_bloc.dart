import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  DocumentSnapshot documents;

  @override
  CourseState get initialState => CourseInitial();

  @override
  Stream<CourseState> mapEventToState(CourseEvent event) async* {
    try {
      
    } catch (e) {
      yield CourseNotDelivered(message: e.toString());
    }
  }
}
