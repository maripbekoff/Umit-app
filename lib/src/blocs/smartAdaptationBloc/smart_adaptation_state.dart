part of 'smart_adaptation_bloc.dart';

abstract class SmartAdaptationState extends Equatable {}

class CurrentPageState extends SmartAdaptationState {
  int currentPage = 0;

  CurrentPageState({@required this.currentPage});

  @override
  List<Object> get props => null;
}

class OpenSettings extends SmartAdaptationState {
  @override
  List<Object> get props => null;
}

class SwitchThemeState extends SmartAdaptationState {
  bool isSwitched = true;

  SwitchThemeState({@required this.isSwitched});

  @override
  List<Object> get props => null;
}
