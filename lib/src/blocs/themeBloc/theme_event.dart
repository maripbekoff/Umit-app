import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:umit/src/global/themes.dart';

abstract class ThemeEvent extends Equatable {}

class ThemeChanged extends ThemeEvent {
  var theme;

  ThemeChanged({@required this.theme});

  @override
  List<Object> get props => [theme];
}
