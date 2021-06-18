import 'package:avatar_letter/avatar_letter.dart';
import 'package:chat_socket_getx/helper/utils.dart';
import 'package:chat_socket_getx/model/answer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class RowAnswer extends StatelessWidget {
  Answer answer;
  RowAnswer({
    this.answer
});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AvatarLetter(
                  size: 31,
                  fontSize: 14,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  upperCase: true,
                  letterType: LetterType.Circular,
                  text: answer.name,
                  fontFamily: "Roboto",
                ),
                SizedBox(width: 6,),
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(answer.name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Roboto"),),
                      SizedBox(height: 4,),
                      Text(Utils().getDiff(answer.date),style: TextStyle(color: Colors.black45,fontFamily: "Roboto",fontSize: 12),)
                    ],
                  ),
                ))
              ],
            ),
          ),
          SizedBox(height: 6,),
          HtmlWidget(answer.answer),
        ],
      ),
    );
  }
}
