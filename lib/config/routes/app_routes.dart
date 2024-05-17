import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spy/core/utils/app_strings.dart';
import 'package:spy/view/start_game/start_game_view.dart';

import '../../view/choose_spy.dart';
import '../../view/game_rules.dart';
import '../../view/home.dart';
import '../../view/timer_view.dart';
import '../../view_model/random_spy_cubit.dart';


class Routes {
  static const String initialRoute = '/';
  static const String startGameRoute = '/start_game';
  static const String chooseSpyRoute = '/choose_spy';
  static const String timerRoute = '/timer';
  static const String gameRulesRoute = '/rules';
}


class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {

    switch (routeSettings.name) {
      case Routes.initialRoute:
        return PageTransition(child:const HomeView(),type: PageTransitionType.rightToLeft);

        case Routes.startGameRoute:
        return PageTransition(child: StartGameView(),type: PageTransitionType.leftToRight);

      // case Routes.chooseSpyRoute:
      //   return PageTransition(child: ChooseSpy(typeOfQuestions:RandomSpyCubit.get(context).typeOfQuestions!, playerNumbers:RandomSpyCubit.get(context).playerNumbers!,),type: PageTransitionType.leftToRight);

      case Routes.timerRoute:
        return PageTransition(child:const CountDownTimerView(),type: PageTransitionType.leftToRight);

      case Routes.gameRulesRoute:
        return PageTransition(child: const GameRules(),type: PageTransitionType.leftToRight);

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) =>
        const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        )));
  }
}
