
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy/view_model/random_spy_states.dart';

import '../core/utils/constants.dart';

class RandomSpyCubit extends Cubit<RandomSpyStates>{
  RandomSpyCubit():super(RandomSpyInitialStates());
  static RandomSpyCubit get(context)=>BlocProvider.of(context);

  List<bool> playerStatus = [];
  int counter=0;

  void counterPlus(){
    counter++;
    emit(AddCounterStates());
  }

  String chooseRandomString({required QuestionType typeOfQuestions}){
    if (typeOfQuestions==QuestionType.food) {
      foodList.shuffle();
      int randomNumber = Random().nextInt(foodList.length);
      return foodList[randomNumber];
    }
    else if (typeOfQuestions==QuestionType.place) {
      placesList.shuffle();
      int randomNumber = Random().nextInt(placesList.length);
      return placesList[randomNumber];
    }
    else if (typeOfQuestions==QuestionType.character) {
      charactersList.shuffle();
      int randomNumber = Random().nextInt(charactersList.length);
      return charactersList[randomNumber];
    }
    else
     {
       return "error you don't choose any type of questions";
     }
  }

  void chooseRandomSpy({required int playerNumbers}) {
    playerStatus.clear();
    for (int i = 0; i < playerNumbers; i++) {
      playerStatus.add(false); // Set all players as non-spies initially
    }
    // Randomly select the spies
    int numSpies = (playerNumbers < 5) ? 1 : Random().nextInt(3);
    for (int i = 0; i < numSpies; i++) {
      int spyIndex = Random().nextInt(playerNumbers);
      playerStatus[spyIndex] = true; // Mark the player as a spy
    }

  }

}

enum QuestionType{food,place,character}