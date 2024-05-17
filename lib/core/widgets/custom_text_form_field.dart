
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/values_manager.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {

  final String? hint;
  final  onSave;
  final  validator;
  final TextEditingController? textEditingController;

   const CustomTextFormField({super.key,
    this.hint,
    this.onSave,
    this.validator,
  this.textEditingController
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSave,
      validator: validator,
      controller: textEditingController,
      onTapOutside: (event){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        hintText: hint,
        // prefixIcon: Icon(Icons.search_outlined),
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        contentPadding: const EdgeInsets.all(12),

        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          )
        ),

        fillColor: Colors.white,
      ),cursorColor: AppColors.primaryColor,
    );
  }
}
