import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

abstract class ThemeState extends Equatable {}

class ThemeChangedState extends ThemeState {
  final ThemeData themeData;

  ThemeChangedState({@required this.themeData});

  @override
  List<Object> get props => [themeData];
}
