import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:umit/src/global/themes.dart';

abstract class ThemeEvent extends Equatable {
  ThemeEvent([List props = const []]) : super();
}

class ThemeChanged extends ThemeEvent {
  final Theme theme;

  ThemeChanged({@required this.theme}): super([theme]);

  @override
  List<Object> get props => null;

}