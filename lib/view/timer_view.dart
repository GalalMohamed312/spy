import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spy/core/utils/app_colors.dart';

import '../config/routes/app_routes.dart';
import '../core/utils/values_manager.dart';
import '../core/widgets/custom_buttom.dart';
import '../core/widgets/custom_text.dart';



class CountDownTimerView extends StatefulWidget {
  const CountDownTimerView({super.key});

  @override
  State<CountDownTimerView> createState() => _CountDownTimerViewState();
}

class _CountDownTimerViewState extends State<CountDownTimerView> {
  Timer? timer;
  static const Duration countDownDuration=Duration(minutes: 10);
  Duration duration=Duration(minutes:countDownDuration.inMinutes);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTime(),
          SizedBox(height:24.h),
          CustomButton(  onPress:(){
            Navigator.pushReplacementNamed(context, Routes.startGameRoute);
          },text:"إنهاء المباراة",
          ),

        ],
      ),
    );
  }
  
  Widget buildTime() {
    String twoDigits(int n)=> n.toString().padLeft(2,'0');
    final minutes=twoDigits(duration.inMinutes.remainder(60));
    final seconds=twoDigits(duration.inSeconds.remainder(60));
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimeCard(time:minutes,header:"MINUTES"),
          SizedBox(width:8.w),
          buildTimeCard(time:seconds,header:"SECONDS"),
        ],
      ),
    );
  }
  
  void startTimer() {
    timer=Timer.periodic(const Duration(seconds: 1), (_)=>subtractTime());
  }
  
  subtractTime() {
    const subtractSecond=-1;
    setState(() {
        final seconds=duration.inSeconds+subtractSecond;
        if(seconds<0){
          timer?.cancel();
        }
        else{
        duration=Duration(seconds: seconds);
        }
    }
    );
  
  }
  
  Widget buildTimeCard({required String time, required String header}) {
    return    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8.sp),
          height:50.sp,
          width:60.sp,
          alignment:Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(time,style:  TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black
                ),),
        ),
        SizedBox(height: 12.h,),
      Text(header,style:  TextStyle(
        color: AppColors.white,
        fontSize: 12.sp,
        ),)
      ],
    );
  }
}

