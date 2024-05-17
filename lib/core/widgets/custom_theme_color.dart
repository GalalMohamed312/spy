import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy/core/utils/app_colors.dart';

Color customThemeColor({Color colorDark=AppColors.white,Color colorLight=AppColors.black,required BuildContext context}){
//  if(BlocProvider.of<ThemeCubit>(context).themeMode==ThemeMode.light){
  //  return colorLight;
//  }
//  else
 {
   return colorDark; 
 }
}