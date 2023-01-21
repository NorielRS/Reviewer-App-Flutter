import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app_functions/main.dart';

// class QuestionsToShowClass {
//   String recievedQuestion;

//   QuestionsToShowClass({required this.recievedQuestion});
// }

// class QuestionsCards extends StatelessWidget {
//   final QuestionsToShowClass pinasangQuestion;
//   final Function remov;

//   QuestionsCards({required this.pinasangQuestion, required this.remov});
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onHorizontalDragStart: (details) {
//         remov();
//       },
//       child: Card(
//         color: Color.fromARGB(255, 223, 214, 207),
//         shadowColor: Color.fromARGB(255, 78, 70, 47),
//         elevation: 3,
//         margin: EdgeInsets.fromLTRB(
//           10,
//           5,
//           10,
//           0,
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 pinasangQuestion.recievedQuestion,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ---------------------------------------------------------------------------------------

class ResultClass {
  String question;
  String answer;
  String inputAnswer;
  String checkedAnswer;

  ResultClass(
      {required this.question,
      required this.answer,
      required this.inputAnswer,
      required this.checkedAnswer});
}

class QuizCards extends StatelessWidget {
  final ResultClass values;
  QuizCards({required this.values});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(
        10,
        5,
        10,
        0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            values.question,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Correct answer: ' + values.answer,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[900],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'My answer:  ' + values.inputAnswer,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
          Text(
            values.checkedAnswer,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color:
                  values.checkedAnswer == 'Correct' ? Colors.green : Colors.red,
            ),
          ),
        ]),
      ),
    );
  }
}
