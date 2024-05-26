import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app_constants.dart';
import 'theme_attrs.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences prefs;

  ThemeBloc({required this.prefs}) : super(ThemeInitial()) {
    on<LoadTheme>(_onLoadTheme);
    on<ToggleTheme>(_onToggleTheme);

    add(LoadTheme());
  }

  void _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) {
    try {
      int? modeIndex = prefs.getInt(AppConstants.themeKey);
      ThemeModes mode = modeIndex == null ? ThemeModes.light : ThemeModes.values[modeIndex];
      ThemeAttrs attrs = mode == ThemeModes.light ? LightThemeAttrs() : DarkThemeAttrs();
      emit(ThemeLoaded(attrs));
    } catch (e) {
      emit(ThemeError(e.toString()));
    }
  }

  Future<void> _onToggleTheme(ToggleTheme event, Emitter<ThemeState> emit) async {
    if (state is ThemeLoaded) {
      final currentState = state as ThemeLoaded;
      try {
        bool isLight = currentState.attrs.mode == ThemeModes.light;
        ThemeAttrs newAttrs = isLight ? DarkThemeAttrs() : LightThemeAttrs();
        await prefs.setInt(AppConstants.themeKey, newAttrs.mode.index);
        emit(ThemeLoaded(newAttrs));
      } catch (e) {
        emit(ThemeError(e.toString()));
      }
    }
  }
}