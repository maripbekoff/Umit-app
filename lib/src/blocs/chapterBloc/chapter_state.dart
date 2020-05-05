part of 'chapter_bloc.dart';

abstract class ChapterState extends Equatable {}

class ChapterInitial extends ChapterState {
  int currentPage = 0;

  ChapterInitial({@required this.currentPage});

  @override
  List<Object> get props => null;
}
