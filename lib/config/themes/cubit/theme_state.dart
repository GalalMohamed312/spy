import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeState extends Equatable {
  final ThemeMode themeMode;
  const ThemeState(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

class InitialThemeState extends ThemeState {
  const InitialThemeState(super.themeMode);

}
class ChangeThemeState extends ThemeState {
  const ChangeThemeState(ThemeMode selectedTheme) : super(selectedTheme);
}
