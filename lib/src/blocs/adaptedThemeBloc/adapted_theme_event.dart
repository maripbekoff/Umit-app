import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:umit/src/global/themes.dart';

abstract class AdaptedThemeEvent extends Equatable {}

class AdaptedThemeToggled extends AdaptedThemeEvent {
<<<<<<< HEAD
  AppTheme adaptedAppTheme;
=======
  var adaptedAppTheme;
>>>>>>> 2256d318e5fb97735dd32bf645574e98f033aa5d

  AdaptedThemeToggled({@required this.adaptedAppTheme});

  @override
  List<Object> get props => null;
}
