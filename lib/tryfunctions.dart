import 'package:flutter/material.dart';

List<List> myList = [
  ['hahahaha', 'a'],
  ['hehehehe', 'b']
];

void main(List<String> args) {
  print(myList);
}

class NewCards extends StatelessWidget {
  final String pinasangString;
  final Function burahin;

  NewCards({required this.pinasangString, required this.burahin});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        burahin();
      },
      child: Card(
        color: Color.fromARGB(255, 223, 214, 207),
        shadowColor: Color.fromARGB(255, 78, 70, 47),
        elevation: 3,
        margin: EdgeInsets.fromLTRB(
          10,
          5,
          10,
          0,
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                pinasangString,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
