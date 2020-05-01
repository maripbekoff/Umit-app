part of 'chapter_bloc.dart';

abstract class ChapterState extends Equatable {
  const ChapterState();
}

class ChapterInitial extends ChapterState {
  @override
  List<Object> get props => [];
}

class ChapterCurrentPageState extends ChapterState {
  int currentPage;

  ChapterCurrentPageState({@required this.currentPage});

  @override
  List<Object> get props => [this.currentPage];
}
