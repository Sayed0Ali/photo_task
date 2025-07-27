part of 'theme_data_cubit.dart';

@immutable
sealed class ThemeDataState {}

final class ThemeDataInitial extends ThemeDataState {}
final class ThemeChangeSuccess extends ThemeDataState {}
final class ThemeChangeFailure extends ThemeDataState {}
final class ThemeChangeLight extends ThemeDataState {}
final class ThemeChangeDark extends ThemeDataState {}

