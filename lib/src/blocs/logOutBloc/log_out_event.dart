import 'package:equatable/equatable.dart';

abstract class LogOutEvent extends Equatable {}

class LogOutButtonPressedEvent extends LogOutEvent {
  @override
  List<Object> get props => null;
}