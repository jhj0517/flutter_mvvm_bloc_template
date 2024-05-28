import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app_constants.dart';
import 'theme_attrs.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences prefs;

  ThemeCubit({required this.prefs}) : super(const ThemeState()) {
    _loadTheme();
  }

  Future<void> toggleTheme() async {
    final isLight = state.attrs?.mode == ThemeModes.light;
    final newAttrs = isLight ? DarkThemeAttrs() : LightThemeAttrs();
    await prefs.setInt(AppConstants.themeKey, newAttrs.mode.index);
    emit(state.copyWith(attrs: newAttrs));
  }

  void _loadTheme() {

    final modeIndex = prefs.getInt(AppConstants.themeKey);
    final mode = modeIndex == null ? ThemeModes.light : ThemeModes.values[modeIndex];
    final newAttrs = mode == ThemeModes.light ? LightThemeAttrs() : DarkThemeAttrs();
    emit(state.copyWith(attrs: newAttrs));
  }
}