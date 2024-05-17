import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spy/core/utils/values_manager.dart';
import '../utils/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  final Function()? onPress;
  final double fontSize;

  const CustomButton({super.key,
    required this.onPress,
    this.text = 'Write text ',
    this.color = AppColors.primaryColor,
  this.fontSize=16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width>500?MediaQuery.of(context).size.width*.5:MediaQuery.of(context).size.width*0.7,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius:   BorderRadius.circular(12.0.r),
        ),
        height: 30.sp,
        minWidth: MediaQuery.of(context).size.width*.5,
        padding: const EdgeInsets.all(10),
        onPressed: onPress,
        color: AppColors.primaryColor,
        child: CustomText(
          alignment: Alignment.center,
          fontSize: fontSize==16?AppSize.s16:fontSize,
          text: text,
          color: Colors.white,
        ),
      ),
    );
  }
}
