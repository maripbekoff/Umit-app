part of 'chapter_bloc.dart';

abstract class ChapterEvent extends Equatable {
  const ChapterEvent();
}

class ChapterSlidedPage extends ChapterEvent {
  int currentPage;

  ChapterSlidedPage({@required this.currentPage});

  @override
  List<Object> get props => null;
}
