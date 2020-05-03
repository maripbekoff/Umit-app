import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AdaptedThemeState extends Equatable {}

class AdaptedThemeInitialState extends AdaptedThemeState {
  @override
  List<Object> get props => null;
}

class AdaptedThemeAdapted extends AdaptedThemeState {
  ThemeData themeData;

  AdaptedThemeAdapted({@required this.themeData});

  @override
  List<Object> get props => [themeData];
}
