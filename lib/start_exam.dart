import 'package:flutter/material.dart';
import 'package:quiz_app_functions/function.dart';
import 'package:quiz_app_functions/main.dart';
import 'package:quiz_app_functions/quiz_result.dart';

import 'app_defaults_design_class.dart';

class StartExam extends StatefulWidget {
  @override
  State<StartExam> createState() => _StartExamState();
}

class _StartExamState extends State<StartExam> {
  final userInputAnswer = TextEditingController();

  List currentQuestionAndAnswer = randomQuestionSetter(mainList);

  @override
  Widget build(BuildContext context) {
    // currentQuestionAndAnswer.add(currentQuestionAndAnswer);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 223, 214, 207),
          body: SafeArea(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 20),
                    TitleText(
                      title_text: 'Answer the Question',
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 300,
                      padding: EdgeInsets.all(5),
                      child: Text(currentQuestionAndAnswer[0],

//                           """This is a Question:

// Errors are Red,
// Functions are Blue,
// This Upcoming Christmas Day
// Can you be my boo?

// return 1 or 0;

//                             """,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 49, 100, 80))),
                    ),
                    // SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(25),
                      child: TextField(
                        controller: userInputAnswer,
                        decoration: InputDecoration(
                          // (icon: Icon(Icons.close)),
                          labelText: 'Answer: ',
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          // filled: true,
                          // fillColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 88, 79, 54),
                                width: 3),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        answerChecker(currentQuestionAndAnswer[1],
                            userInputAnswer.text, userInputAnswer);

                        if (mainList.isEmpty) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => QuizResult())));
                        } else
                          setState(() {
                            currentQuestionAndAnswer =
                                randomQuestionSetter(mainList);
                          });
                      },
                      child: AppButton(
                        text: "Confirm Answer",
                        font_Size: 25,
                        but_hieght: 50,
                        but_width: 300,
                        margin_all: 10,
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => QuizResult())));
                        currentQuestionAndAnswer.addAll(mainList);
                        mainList.clear();
                      },
                      child: AppButton(
                        text: "End or View Score ",
                        font_Size: 25,
                        but_hieght: 50,
                        but_width: 300,
                        margin_all: 10,
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}
