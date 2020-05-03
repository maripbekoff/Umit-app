part of 'selected_theme_bloc.dart';

abstract class SelectedThemeEvent extends Equatable {}

class SelectedTheme extends SelectedThemeEvent {
  int selectedThemeIndex;

  SelectedTheme({@required this.selectedThemeIndex});

  @override
  List<Object> get props => null;
}
