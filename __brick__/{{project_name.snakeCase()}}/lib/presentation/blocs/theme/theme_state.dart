import 'package:equatable/equatable.dart';

import 'theme_attrs.dart';

class ThemeState extends Equatable {
  final ThemeAttrs? attrs;

  const ThemeState({
    this.attrs,
  });

  ThemeState copyWith({
    ThemeAttrs? attrs,
  }) {
    return ThemeState(
      attrs: attrs ?? this.attrs,
    );
  }

  @override
  List<Object?> get props => [attrs];
}
