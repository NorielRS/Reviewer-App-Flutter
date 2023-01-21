import 'package:flutter/material.dart';
import 'package:quiz_app_functions/quiz_cards.dart';
import 'package:quiz_app_functions/start_exam.dart';
import 'function.dart';
import 'app_defaults_design_class.dart';
import 'tryfunctions.dart';
// 392.72727272727275 screen width
// 781.0909090909091  screen height

void main() {
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: CreateReviewer()));
}

class CreateReviewer extends StatefulWidget {
  @override
  State<CreateReviewer> createState() => _MyAppState();
}

List<List> mainList = [];
// List<QuestionsToShowClass> ListNgMgaQuestionsLang = [];

class _MyAppState extends State<CreateReviewer> {
  final questionController = TextEditingController();
  final answerController = TextEditingController();
  final questionNode = FocusNode();

  @override
  void initState() {
    super.initState();

    questionController.addListener(() => setState(() {}));
    answerController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 223, 214, 207),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TitleText(
                      title_text: 'Create Your Reviewer',
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 200,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        // child: Column(
                        //   children: ListNgMgaQuestionsLang.map(
                        //       (pinasangQues) => QuestionsCards(
                        //           pinasangQuestion: pinasangQues,
                        //           remov: () {
                        //             setState(() {
                        //               ListNgMgaQuestionsLang.remove(
                        //                   pinasangQues);
                        //             });
                        //           })).toList(),
                        // ),

                        child: Column(
                          //------------> from tryfunctions file
                          children: mainList
                              .map((pinasangQues) => NewCards(
                                  pinasangString: pinasangQues[0],
                                  burahin: () {
                                    setState(() {
                                      mainList.remove(pinasangQues);
                                    });
                                  }))
                              .toList(),
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        focusNode: questionNode,
                        controller: questionController,
                        maxLines: 6,
                        decoration: InputDecoration(
                          suffixIcon: questionController.text.isEmpty
                              ? Container(
                                  width: 0,
                                )
                              : IconButton(
                                  icon: Icon(Icons.clear_sharp),
                                  onPressed: () {
                                    questionController.clear();
                                  },
                                ),
                          // (icon: Icon(Icons.close)),
                          labelText: 'Enter Question',
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3)),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: answerController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          suffixIcon: answerController.text.isEmpty
                              ? Container(
                                  width: 0,
                                )
                              : IconButton(
                                  icon: Icon(Icons.clear_sharp),
                                  onPressed: () {
                                    answerController.clear();
                                  },
                                ),
                          // (icon: Icon(Icons.close)),
                          labelText: 'Correct Answer',
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 15),

                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (questionController.text.isEmpty &&
                            answerController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('No Question And Answer Input')));
                        } else if (answerController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No Answer Input')));
                        } else if (questionController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No Question Input')));
                        } else {
                          newListSetter(
                              questionController.text,
                              answerController.text,
                              questionController,
                              answerController,
                              context,
                              questionNode);
                        }
                      },
                      child: AppButton(
                        text: "Save Quiz",
                        font_Size: 25,
                        but_hieght: 50,
                        but_width: 300,
                        margin_all: 10,
                      ),
                    ),

// ----------------------------------------------------------------
                    InkWell(
                      onTap: () {
                        if (mainList.isEmpty) {
                        } else {
                          currentListOfQuizTakenforQuizAgainFunction
                              .addAll(mainList);
                          // ListNgMgaQuestionsLang.clear();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StartExam(),
                          ));
                        }
                      },
                      child: AppButton(
                        text: "Start Exam",
                        font_Size: 25,
                        but_hieght: 50,
                        but_width: 300,
                        margin_all: 10,
                      ),
                    ),
// ---------------------------------------------------------------------
                    InkWell(
                      onTap: () => null,
                      child: AppButton(
                        text: "Version 1.0 ",
                        font_Size: 25,
                        but_hieght: 50,
                        but_width: 300,
                        margin_all: 20,
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}
