import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umit/src/blocs/themeBloc/theme_event.dart';
import 'package:umit/src/blocs/themeBloc/theme_state.dart';
import 'package:umit/src/global/themes.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeState(themeData: themeData[Theme.Light]);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChanged)
      yield ThemeState(themeData: themeData[event.theme]);
  }
}
