import 'package:equatable/equatable.dart';

import 'theme_attrs.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final ThemeAttrs attrs;

  const ThemeLoaded(this.attrs);

  @override
  List<Object> get props => [attrs];
}

class ThemeError extends ThemeState {
  final String message;

  const ThemeError(this.message);

  @override
  List<Object> get props => [message];
}
