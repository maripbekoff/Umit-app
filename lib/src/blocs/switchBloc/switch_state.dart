part of 'switch_bloc.dart';

abstract class SwitchState extends Equatable {}

class SwitchInitial extends SwitchState {
  @override
  List<Object> get props => [false];
}

class SwitchChangedTheme extends SwitchState {
  bool isSwitched;

  SwitchChangedTheme({@required this.isSwitched});

  @override
  List<Object> get props => [this.isSwitched];
}
