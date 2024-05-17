import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/routes/app_routes.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/values_manager.dart';
import '../core/widgets/custom_buttom.dart';
import '../view_model/random_spy_cubit.dart';
import '../view_model/random_spy_states.dart';


class ChooseSpy extends StatefulWidget
{

  const ChooseSpy({super.key, required this.typeOfQuestions, required this.playerNumbers,});
  final QuestionType typeOfQuestions;
  final int playerNumbers;
  @override
  State<ChooseSpy> createState() => _ChooseSpyState();
}

class _ChooseSpyState extends State<ChooseSpy> {
  int numPlayers = 5;
 // Default number of players
  int counter=0;

  String? password;

  void revealSpy(int playerIndex,cubit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('اللاعب رقم ${playerIndex + 1}'),
          content: Container(
            padding:EdgeInsets.all(20.sp),
            height:MediaQuery.of(context).size.height*0.4,
            decoration:BoxDecoration(
              color:AppColors.primaryColor,
              borderRadius:BorderRadius.circular(12.r),

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cubit.playerStatus[playerIndex] ? 'انت الجاسوس' : 'ليس انت الجاسوس',
                ),
                SizedBox(height:24.h),
                Text(
                  cubit.playerStatus[playerIndex] ? '' : 'كلمة السر : $password'
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('حسنا',style:TextStyle(
                color:AppColors.white,
                fontWeight:FontWeight.w500,
                fontSize:AppSize.s16,
              )),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
   password= RandomSpyCubit.get(context).chooseRandomString(typeOfQuestions:widget.typeOfQuestions );
   RandomSpyCubit.get(context).chooseRandomSpy(playerNumbers: widget.playerNumbers);
   RandomSpyCubit.get(context).counter=0;
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:
      BlocConsumer<RandomSpyCubit, RandomSpyStates>(
        listener: (BuildContext context, RandomSpyStates state) {
        },
        builder: (BuildContext context, RandomSpyStates state) {
          var cubit = RandomSpyCubit.get(context);
          return    Center(
            child:
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(

                  child:
              CustomButton(onPress: () {
                if(cubit.counter<widget.playerNumbers){
                  revealSpy(cubit.counter,cubit);
                  cubit.counterPlus();

                }
                else{
                  Navigator.pushReplacementNamed(context, Routes.timerRoute);
                }
              },text:cubit.counter<widget.playerNumbers?"هل انت الجاسوس؟":"بدء الوقت"),
                  // ElevatedButton(onPressed: (){
                  //
                  //   if(cubit.counter<widget.playerNumbers){
                  //     revealSpy(cubit.counter,cubit);
                  //     cubit.counterPlus();
                  //
                  //   }
                  //   else{
                  //     Navigator.pushNamed(context, Routes.timerRoute);
                  //
                  //   }
                  //
                  //
                  // }, child:
                  // Container(
                  //     width: MediaQuery.of(context).size.width*.5,
                  //     height: 40.sp,
                  //     alignment: Alignment.center,
                  //     child: Text(cubit.counter<widget.playerNumbers?"هل انت الجاسوس؟":"بدء الوقت",style:TextStyle(
                  //         color: AppColors.white,
                  //         fontWeight: FontWeight.w700,
                  //         fontSize: 24.sp
                  //     ))),),
                ),

              ],
            ),
          );
        },
      )
      );
  }

  Widget spy(int i){
    return Text('Player ${i + 1}');
  }

}
