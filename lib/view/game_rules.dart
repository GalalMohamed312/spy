import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/values_manager.dart';
import '../core/widgets/custom_text.dart';

class GameRules extends StatelessWidget {
  const GameRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:  Padding(
        padding: EdgeInsets.all(20.sp),
        child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomText(
                fontSize:AppSize.s20,
                text:"يجب ان تدخل عدد اللاعبين وان لا يقل العدد عن ثلاثة لاعبين وممكن ان تحتوي اللعبة علي أكثر من جاسوس إذا كان عدد اللاعبين 5 أو أكثر ويجب أن تختار نوع كلمة السر إذا كانت أكلة أو مكان أو شخصية مشهورة."),

          ],
        ),
      )
    );
  }
}
