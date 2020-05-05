import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'chapter_event.dart';
part 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  @override
  ChapterState get initialState => ChapterInitial(currentPage: 0);

  @override
  Stream<ChapterState> mapEventToState(ChapterEvent event) async* {
    if (event is ChapterSlidedPage) {
      yield ChapterInitial(currentPage: event.currentPage);
    }
  }
}
