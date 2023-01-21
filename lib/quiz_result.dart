import 'package:flutter/material.dart';
import 'package:quiz_app_functions/main.dart';

import 'package:quiz_app_functions/quiz_cards.dart';
import 'package:quiz_app_functions/start_exam.dart';

import 'app_defaults_design_class.dart';
import 'function.dart';

class QuizResult extends StatefulWidget {
  @override
  State<QuizResult> createState() => _QuizResultState();
}

List<ResultClass> quizResultsList3D = [];

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 214, 207),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            TitleText(title_text: 'Quiz Result'),
            SizedBox(height: 10),
            Container(
              width: 320,
              child: Text(
                'Total Score: ' + score.toString(),
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: score > 0 ? Colors.green : Colors.red,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 570,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: quizResultsList3D
                      .map((values) => QuizCards(
                            values: values,
                          ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    mainList.clear();
                    quizResultsList3D.clear();
                    currentListOfQuizTakenforQuizAgainFunction.clear();
                    score = 0;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => CreateReviewer(),
                    ));
                  },
                  child: AppButton(
                    text: "Main Menu",
                    font_Size: 14,
                    but_hieght: 40,
                    but_width: 110,
                    margin_all: 0,
                  ),
                ),
                InkWell(
                  child: AppButton(
                    text: "Save Reviewer",
                    font_Size: 14,
                    but_hieght: 40,
                    but_width: 110,
                    margin_all: 0,
                  ),
                ),
                InkWell(
                  onTap: () {
                    mainList.addAll(currentListOfQuizTakenforQuizAgainFunction);

                    quizResultsList3D.clear();
                    score = 0;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => StartExam(),
                    ));
                  },
                  child: AppButton(
                    text: "Quiz Again",
                    font_Size: 14,
                    but_hieght: 40,
                    but_width: 110,
                    margin_all: 0,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
