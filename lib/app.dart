import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spy/view/home.dart';
import 'package:spy/view_model/game_cubit.dart';
import 'package:spy/view_model/random_spy_cubit.dart';
import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';


class SpyApp extends StatelessWidget {
  // const PharmacyApp({super.key});
  const SpyApp._internal();
  static const _instance=SpyApp._internal();
  factory SpyApp()=>_instance;


  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [

          BlocProvider(create: (context) => GameCubit()),
          BlocProvider(create: (context) =>  RandomSpyCubit()),
        ],

          child:MaterialApp(

              title: AppStrings.arabicCode,
              locale: const Locale(AppStrings.arabicCode),
              debugShowCheckedModeBanner: false,
              theme: themeDark,

              onGenerateRoute: AppRoutes.onGenerateRoute,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
              AppLocalizationsSetup.localizationsDelegates,
              home: ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                // Use builder only if you need to use library outside ScreenUtilInit context
                builder: (_, child) {
                  return const HomeView();
                },
              )));
        // },
      // );
    }
    // ),);
  }

// }
