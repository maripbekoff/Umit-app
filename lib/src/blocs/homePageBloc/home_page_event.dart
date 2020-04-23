import 'package:equatable/equatable.dart';
import 'package:umit/ui/pages/home_page.dart';

abstract class HomePageEvent extends Equatable {}

class LogOutButtonPressedEvent extends HomePageEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}