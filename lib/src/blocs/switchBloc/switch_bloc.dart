import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  @override
  SwitchState get initialState => SwitchInitial();

  @override
  Stream<SwitchState> mapEventToState(SwitchEvent event) async* {
    if (event is SwitchChanged) {
      yield SwitchChangedTheme(isSwitched: event.isSwitched);
    }
  }
}
