

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_strings.dart';

abstract class ThemeLocalDataSource {
  Future<bool> changeTheme({required String themeMode});
  Future<String> getSavedTheme();
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final SharedPreferences sharedPreferences;

  ThemeLocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<bool> changeTheme({required String themeMode})  async =>
      await sharedPreferences.setString(AppStrings.theme, themeMode);

  @override
  Future<String> getSavedTheme()async=>
    sharedPreferences.containsKey(AppStrings.theme)
        ? sharedPreferences.getString(AppStrings.theme)!
        : AppStrings.dark;

}
