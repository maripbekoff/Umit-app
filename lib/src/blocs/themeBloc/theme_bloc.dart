import 'package:bloc/bloc.dart';
import 'package:umit/src/global/themes.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState =>
      ThemeState(themeData: themeData[AppTheme.Light]);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChanged) {
      print(event.theme);
      yield ThemeState(themeData: themeData[event.theme]);
    }
  }
}
