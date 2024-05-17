
import 'package:flutter/material.dart';

void showToast({
  required String text,
  required ToastStates state,
}){
  // Fluttertoast.showToast(
  //     msg:text ,
  //     toastLength: Toast.LENGTH_LONG,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 10,
  //     backgroundColor: chooseToastColor(state),
  //     textColor: Colors.white,
  //     fontSize: 16.0
  // );
}
//enum
enum ToastStates{success, error ,warning}

Color chooseToastColor(ToastStates state){
  Color color ;
  switch(state)
  {
    case  ToastStates.success :
      color = Colors.green ;
      break;
    case  ToastStates.error :
      color = Colors.red ;
      break;
    case  ToastStates.warning:
      color = Colors.yellow ;
      break;

  }
  return color ;
}
//
// //TODO REFRESH TOKEN
//   String? accessToken  ;
// Future<String> getToken()async{
//  await DioHelper.dio.post(REFRESHTOKEN,
//     options: Options(
//       headers: {
//         // 'Authorization': 'Bearer ${CacheHelper.getData()!.refreshToken}',
//       },
//     ),
//   ).then((value){
//    accessToken = value.data['access_token'] ;
//    print(value.data['access_token']);
//   }).catchError((error){
//     print('error when get token ${error.toString()}');
//   });
//   return  accessToken! ;
// }
//
