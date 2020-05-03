part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {}

class SwitchChanged extends SwitchEvent {
  bool isSwitched;

  SwitchChanged({@required this.isSwitched});

  @override
  List<Object> get props => [this.isSwitched];
}
