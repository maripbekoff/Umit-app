import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:umit/src/global/themes.dart';

abstract class AdaptedThemeEvent extends Equatable {}

class AdaptedThemeToggled extends AdaptedThemeEvent {
  AppTheme adaptedAppTheme;

  AdaptedThemeToggled({@required this.adaptedAppTheme});

  @override
  List<Object> get props => null;
}
