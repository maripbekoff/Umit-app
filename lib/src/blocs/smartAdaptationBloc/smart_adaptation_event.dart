part of 'smart_adaptation_bloc.dart';

abstract class SmartAdaptationEvent extends Equatable {}

class ButtonPressedYes extends SmartAdaptationEvent {
  int questionNumber;

  ButtonPressedYes({@required this.questionNumber});

  @override
  List<Object> get props => null;
}

class ButtonPressedNo extends SmartAdaptationEvent {
  int questionNumber;

  ButtonPressedNo({@required this.questionNumber});

  @override
  List<Object> get props => null;
}

class SlidedToNextPage extends SmartAdaptationEvent {
  int currentPage;

  SlidedToNextPage({@required this.currentPage});

  @override
  List<Object> get props => null;
}
