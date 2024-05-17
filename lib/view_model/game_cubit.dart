import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy/view_model/game_states.dart';
import 'package:spy/view_model/random_spy_cubit.dart';


class GameCubit extends Cubit<GameStates>{
  GameCubit():super(GameInitialStates());
  static GameCubit get(context)=>BlocProvider.of(context);

  int? playerNumbers;
  QuestionType? typeOfQuestions;
  int currentIndex=-1;
  List<bool> colorFlag=[
    false,
    false,
    false
  ];
  List<bool> playerStatus = [];

 void changeIndex(int index){
  currentIndex=index;
  if(index==0){
    typeOfQuestions=QuestionType.food;
  }
  else if(index==1){
    typeOfQuestions=QuestionType.place;
  }
  else if(index==2){
    typeOfQuestions=QuestionType.character;
  }
  _changeColorFlag(index);
  emit(ChangeIndexStates());
}
void _changeColorFlag(int index){
  for(int i=0;i<3;i++){
    if(i==index){
      colorFlag[i]=true;
    }
    else{
      colorFlag[i]=false;
    }
  }
}


}