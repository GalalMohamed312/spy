import 'package:flutter/material.dart';
import 'package:spy/core/utils/app_colors.dart';
import 'package:spy/core/utils/app_strings.dart';

class CustomText extends StatelessWidget {
  final String text;

  final double fontSize;

  final Color color;

  final Alignment alignment;

  final int maxLine;
  final double height;
  final FontWeight fontWeight;

  const CustomText({super.key,
    this.text = '',
    this.fontSize = 16,
    this.color = AppColors.white,
    this.alignment = Alignment.center,
    this.maxLine=50,
    this.height = 1,
  this.fontWeight=FontWeight.w500
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
          fontFamily: AppStrings.fontFamily,
          fontWeight: fontWeight,
        ),
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
  }

