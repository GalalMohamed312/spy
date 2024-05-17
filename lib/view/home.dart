import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spy/config/routes/app_routes.dart';
import 'package:spy/core/utils/app_colors.dart';
import 'package:spy/core/utils/assets.dart';

import '../core/widgets/custom_buttom.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColors.black,
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height:16.h),
              Expanded(
                  child: Image.asset(
                ImageAssets.logo,
                fit: BoxFit.fill,
                color: AppColors.white,
              )),
              // const Spacer(),
              SizedBox(height: 24.h),
              Center(
                child: CustomButton(
                    onPress: () {
                      Navigator.pushNamed(context, Routes.startGameRoute);
                    },
                    text: "بدء اللعبة"),
              ),
              SizedBox(height: 24.h),
              Center(
                child: CustomButton(
                    onPress: () {
                      Navigator.pushNamed(context, Routes.gameRulesRoute);
                    },
                    text: "قواعد اللعبة"),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ));
  }
}
