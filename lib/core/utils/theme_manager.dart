

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spy/core/utils/styles_manager.dart';
import 'package:spy/core/utils/values_manager.dart';

import 'app_colors.dart';

ThemeData themeData(){
  return ThemeData(
  //  main color
    indicatorColor: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    primaryColorLight:  AppColors.amber,
    primaryColorDark:  AppColors.darkGray,
    disabledColor:  AppColors.gray,
  splashColor: AppColors.primaryColor,
  drawerTheme: const DrawerThemeData(
    backgroundColor: AppColors.background
  ),
  //icon theme
  iconTheme:const IconThemeData(
    color: AppColors.black,

  ) ,
  //  card view theme
    cardTheme:  CardTheme(
      color: AppColors.yellow,
      shadowColor: AppColors.gray,
      elevation: AppSize.s2
    ),
    //app bar theme

    appBarTheme:  AppBarTheme(
      centerTitle: false,
      color: AppColors.white,
      elevation: AppSize.s0,
      shadowColor: AppColors.gray,
      titleTextStyle: textStyleBold(color: AppColors.white,fontSize: AppSize.s16),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarBrightness: Brightness.dark
      )
    ),
    //button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),//his border like circle
      disabledColor: AppColors.gray,
      buttonColor: AppColors.primaryColor,
      splashColor: AppColors.darkPrimary,
    ),

    //elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: AppColors.white,
            fontSize: AppSize.s24
        ),

        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    ),
  //  text theme
    textTheme: TextTheme(
      displayLarge: textStyleRegular(color: AppColors.darkGray,
      fontSize: AppSize.s16
      ),
      displayMedium:  textStyleRegular(color: AppColors.darkGray,
          fontSize: AppSize.s14
      ),
      displaySmall:  textStyleRegular(color: AppColors.darkGray,
          fontSize: AppSize.s12
      ),
    ),


    //text form field
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:  EdgeInsets.all(AppPadding.p8),
        labelStyle:  textStyleRegular(color: AppColors.primaryColor,fontSize: AppSize.s14),
        errorStyle:  textStyleRegular(color: AppColors.red,fontSize: AppSize.s14),
        hintStyle: textStyleRegular(color: AppColors.gray,fontSize: AppSize.s14),
      enabledBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.gray,width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
      ),
      focusedBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor,width      : AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red  ,width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
      ),
      focusedErrorBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor,width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
      ),
    )
  );
}