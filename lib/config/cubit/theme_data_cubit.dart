import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_data_state.dart';

class ThemeDataCubit extends Cubit<ThemeDataState> {
  static const String _key = 'theme_mode';

  ThemeDataCubit() : super(ThemeDataInitial());
  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final mode = prefs.getString(_key);

    if (mode == 'light') {
      emit(ThemeMode.light);
    } else if (mode == 'dark') {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.system);
    }
  }

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (state == ThemeMode.light) {
      await prefs.setString(_key, 'dark');
      emit(ThemeMode.dark);
    } else {
      await prefs.setString(_key, 'light');
      emit(ThemeMode.light);
    }
  }
}
