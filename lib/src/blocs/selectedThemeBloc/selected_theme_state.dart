part of 'selected_theme_bloc.dart';

abstract class SelectedThemeState extends Equatable {}

class SelectedThemeInitial extends SelectedThemeState {
  int selectedThemeIndex = 0;

  SelectedThemeInitial({@required this.selectedThemeIndex});

  @override
  List<Object> get props => [this.selectedThemeIndex];
}
