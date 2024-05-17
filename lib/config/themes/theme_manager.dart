import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeManager extends ValueNotifier{
  ThemeManager(super.value);
  ThemeMode _themeMode= ThemeMode.light;
  get themeMode =>_themeMode;
  void _toggleTheme(bool isDark){
    _themeMode=isDark?ThemeMode.dark:ThemeMode.light;
    notifyListeners();
    debugPrint("theme=$_themeMode");
  }

void toLight(){
    _toggleTheme(false);
}
void toDark(){
    _toggleTheme(true);
}

}

// class ThemeCubit extends Cubit<ThemeState> {
//
//   ThemeCubit(super.initialState);
//
//   ThemeMode _themeMode= ThemeMode.dark;
//   ThemeMode get themeMode =>_themeMode;
//   void _toggleTheme({required bool isDark}){
//     _themeMode=isDark?ThemeMode.dark:ThemeMode.light;
//     emit(ChangeThemeState());
//   }
//
//   void toLight(){
//     _toggleTheme(isDark:false);
//   }
//   void toDark(){
//     _toggleTheme(isDark:true);
//   }
//
//   // Future<void> _changeLang(bool isDark) async {
//   //   final response = await changeLangUseCase.call(langCode);
//   //   response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
//   //     currentLangCode = langCode;
//   //     emit(ChangeLocaleState());
//   //   });
//   // }
//
// }