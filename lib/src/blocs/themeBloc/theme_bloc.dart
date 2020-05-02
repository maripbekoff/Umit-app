import 'package:bloc/bloc.dart';
import 'package:umit/src/global/themes.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState =>
      ThemeChangedState(themeData: themeData[AppTheme.Default]);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChanged) {
      yield ThemeChangedState(themeData: themeData[event.theme]);
    }
  }
}
