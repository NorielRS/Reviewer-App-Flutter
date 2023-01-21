import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:quiz_app_functions/quiz_cards.dart';
import 'package:quiz_app_functions/quiz_result.dart';

import 'main.dart';

List<List> currentListOfQuizTakenforQuizAgainFunction = [];
int score = 0;
late List choosenQuestionandAnswer;
/*gumaggawa ng bagong list mula sa ng input na Question at Answer sa Textfield,at ina-add sa mainList
nag c-clear din ng TextField
*/
void newListSetter(String questionControllervalue, String answerControllerValue,
    questionController, answerController, context, questionNode) {
  // ListNgMgaQuestionsLang.add(
  //     QuestionsToShowClass(recievedQuestion: questionControllervalue));
  List newList = [questionControllervalue, answerControllerValue];
  mainList.add(newList);

  questionController.clear();
  answerController.clear();
  FocusScope.of(context).requestFocus(questionNode);
}

List randomQuestionSetter(List mainList) {
  var random = Random();
  int index = random.nextInt(mainList.length);
  choosenQuestionandAnswer = mainList[index];

  // print('This is  Copy List' +
  //     currentListOfQuizTakenforQuizAgainFunction.toString());
  return choosenQuestionandAnswer;
}

String answerChecker(String currentQuestionandAnswerString,
    String userInputAnswerValue, userInputAnswer) {
  userInputAnswer.clear();

  if (currentQuestionandAnswerString.toLowerCase() ==
      userInputAnswerValue.toLowerCase()) {
    score++;
    print("correct");

    quizResultsList3D.add(ResultClass(
        question: choosenQuestionandAnswer[0],
        answer: choosenQuestionandAnswer[1],
        inputAnswer: userInputAnswerValue,
        checkedAnswer: 'Correct'));
    mainList.remove(choosenQuestionandAnswer);

    // return 'Correct';
  } else {
    print(userInputAnswerValue + ' is wrong');
    quizResultsList3D.add(ResultClass(
        question: choosenQuestionandAnswer[0],
        answer: choosenQuestionandAnswer[1],
        inputAnswer: userInputAnswerValue,
        checkedAnswer: 'Incorrect'));

    mainList.remove(choosenQuestionandAnswer);
    // return 'Wrong';
  }
  print(mainList);

  return '';
}
