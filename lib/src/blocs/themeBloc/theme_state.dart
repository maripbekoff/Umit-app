import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;

  ThemeState({@required this.themeData}) : super();

  @override
  List<Object> get props => null;
}
