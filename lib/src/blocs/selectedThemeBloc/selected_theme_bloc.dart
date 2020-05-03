import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'selected_theme_event.dart';
part 'selected_theme_state.dart';

class SelectedThemeBloc extends Bloc<SelectedThemeEvent, SelectedThemeState> {
  @override
  SelectedThemeState get initialState => SelectedThemeInitial(selectedThemeIndex: 0);

  @override
  Stream<SelectedThemeState> mapEventToState(SelectedThemeEvent event) async* {
    if (event is SelectedTheme)
      yield SelectedThemeInitial(selectedThemeIndex: event.selectedThemeIndex);
  }
}
