import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  late Function myfunctions;
  late String text;
  late double but_hieght;
  late double but_width;
  late double font_Size;
  late double margin_all;

  AppButton({
    required this.text,
    required this.font_Size,
    required this.but_hieght,
    required this.but_width,
    required this.margin_all,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(margin_all),
//
      height: MediaQuery.of(context).size.height -
          (MediaQuery.of(context).size.height - but_hieght),
      width: MediaQuery.of(context).size.width -
          (MediaQuery.of(context).size.width - but_width),
//
      child: Text(
        text,
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height - font_Size),
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 78, 70, 47)),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 176, 159, 118),
          border: Border.all(
            width: 1,
            color: Colors.white,
          )),
    );
  }
}

class TitleText extends StatelessWidget {
  late String title_text;
  TitleText({required this.title_text});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Text(
        title_text,
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 88, 79, 54)),
      ),
    );
  }
}
