import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_data_state.dart';

class ThemeDataCubit extends Cubit<ThemeDataState> {
  static const String _key = 'theme_mode';

  ThemeDataCubit() : super(ThemeDataInitial()){
    loadTheme();
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final mode = prefs.getString(_key);

    if (mode == 'light') {
      emit(ThemeChangeLight());
    } else if (mode == 'dark') {
      emit(ThemeChangeDark());
    } else {
      emit(ThemeChangeSuccess());
    }
  }

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final mode = prefs.getString(_key);

    if (mode == 'light') {
      await prefs.setString(_key, 'dark');
      emit(ThemeChangeDark());
    } else if (mode == 'dark') {
      await prefs.setString(_key, 'light');
      emit(ThemeChangeLight());
    } else {
      emit(ThemeChangeSuccess());
    }
  }

  //   final prefs = await SharedPreferences.getInstance();
  //   if (state == ThemeChangeLight) {
  //     await prefs.setString(_key, 'dark');
  //     emit(ThemeChangeDark());
  //   } else {
  //     await prefs.setString(_key, 'light');
  //     emit(ThemeChangeLight());
  //   }
  // }
}
