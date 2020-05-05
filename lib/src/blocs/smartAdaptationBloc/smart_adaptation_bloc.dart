import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'smart_adaptation_event.dart';
part 'smart_adaptation_state.dart';

class SmartAdaptationBloc
    extends Bloc<SmartAdaptationEvent, SmartAdaptationState> {
  @override
  SmartAdaptationState get initialState => CurrentPageState(currentPage: 0);

  @override
  Stream<SmartAdaptationState> mapEventToState(
      SmartAdaptationEvent event) async* {
    if (event is SlidedToNextPage) {
      yield CurrentPageState(currentPage: event.currentPage);
    }
    if (event is ButtonPressedYes) {
      switch (event.questionNumber) {
        case 0:
          yield SwitchThemeState(isSwitched: true);
          break;
        case 1:
          yield SwitchThemeState(isSwitched: true);
          break;
        case 2:
          yield SwitchThemeState(isSwitched: true);
          break;
      }
    }
  }
}
