import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SmartAdaptationEvent extends Equatable {}

class ButtonPressedYes extends SmartAdaptationEvent {
  bool switchName;

  ButtonPressedYes({@required this.switchName});

  @override
  List<Object> get props => null;
}

class ButtonPressedNo extends SmartAdaptationEvent {
  @override
  List<Object> get props => null;
}
