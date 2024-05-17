import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spy/core/utils/assets.dart';
import 'package:spy/core/utils/values_manager.dart';
import 'package:spy/core/widgets/custom_text.dart';

import '../../core/utils/app_colors.dart';
import '../../core/widgets/custom_buttom.dart';
import '../../view_model/game_cubit.dart';
import '../../view_model/game_states.dart';
import '../choose_spy.dart';

class StartGameView extends StatelessWidget {
   StartGameView({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Start Game'),
        // titleTextStyle: TextStyle(
        //     fontWeight: FontWeight.w500,
        //     color: AppColors.white,
        //     fontSize: 20.sp),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: BlocConsumer<GameCubit, GameStates>(
            listener: (BuildContext context, GameStates state) {
         },
            builder: (BuildContext context, GameStates state) {
              var cubit = GameCubit.get(context);
              return    Form(
                key:_formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                          label: Text(
                            "عدد الاعبين",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                        onSaved: (value) {
                          cubit.playerNumbers = value!.isEmpty ?1:int.parse(value) ;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "يجب إدخال رقم";
                          }
                          else if (int.parse(value)<=2) {
                            return "يجب إدخال رقم اكبر من 2";
                          }

                          return null;
                        }),
                    SizedBox(height: 24.h),
                    MediaQuery.of(context).size.width < 500
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            selections(context: context, name:"أكله", image: ImageAssets.food,width: 0.4,onPressed: (){
                              cubit.changeIndex(0);
                            },isSelected: cubit.colorFlag[0]),
                            SizedBox(width:8.w),
                            selections(context: context, name:"مكان", image: ImageAssets.museum,width:0.4,onPressed: (){
                              cubit.changeIndex(1);
                            },isSelected: cubit.colorFlag[1]),
                          ],
                        ),
                        SizedBox(height:8.h),
                        selections(context: context, name:"شخص", image: ImageAssets.man,width: 0.4,onPressed: (){
                              cubit.changeIndex(2);
                            },isSelected: cubit.colorFlag[2]),

                      ],

                    )
                        : Row(
                      children: [
                        selections(context: context,image: ImageAssets.food,name: "أكله",onPressed: (){
                              cubit.changeIndex(0);
                            },isSelected: cubit.colorFlag[0]),
                        // Spacer(),
                        SizedBox(width: 8.w,),
                        selections(context: context,image: ImageAssets.museum,name: "مكان",onPressed: (){
                              cubit.changeIndex(1);
                            },isSelected: cubit.colorFlag[1]),


                        // Spacer(),
                        SizedBox(width: 8.w,),
                        selections(context: context,image: ImageAssets.man,name: "شخص",onPressed: (){
                              cubit.changeIndex(2);
                            },isSelected: cubit.colorFlag[2]),
                      ],
                    ),
                    SizedBox(height:24.h),
                    Center(
                      child:
              CustomButton(onPress:(){
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()&&cubit.currentIndex!=-1) {
                  Navigator.push(context,     PageTransition(child: ChooseSpy(typeOfQuestions:cubit.typeOfQuestions!, playerNumbers: cubit.playerNumbers!,),type: PageTransitionType.leftToRight));

                }
                else if(cubit.currentIndex==-1){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("يجب ان تختار نوعا للسؤال مكان او أكلة او شخصية"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },text:"من الجاسوس"),

                    ),
                  ],
                ),
              );
            },
          )
        ),
      ),
    );
  }

  Widget selections({required BuildContext context,required String name,required String image,double width=0.28,required onPressed,bool isSelected=false}){
    return  Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color:isSelected?AppColors.primaryColor: AppColors.lightLightGray,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(4.sp),
              child: Image.asset(
                image,
                width:
                MediaQuery.of(context).size.width *
                    .05,
              ),
            ),
            const Spacer(),
            CustomText(
              text: name,
              color: AppColors.black,
              fontSize: AppSize.s16,
            ),
          ],
        ),
      ),
    );
  }
}

