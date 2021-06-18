import 'package:avatar_letter/avatar_letter.dart';
import 'package:chat_socket_getx/helper/utils.dart';
import 'package:chat_socket_getx/model/question.dart';
import 'package:chat_socket_getx/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class RowQuestion extends StatelessWidget {
  Question question;
  RowQuestion({
    this.question
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(RouterGenerator.routeDetail,arguments: {
          "question":question
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Material(
          elevation: 1,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
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
                        text: question.name,
                        fontFamily: "Roboto",
                      ),
                      SizedBox(width: 6,),
                      Expanded(child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(question.name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Roboto"),),
                            SizedBox(height: 4,),
                            Text(Utils().getDiff(question.date),style: TextStyle(color: Colors.black45,fontFamily: "Roboto",fontSize: 12),)
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 6,),
                Divider(),
                SizedBox(height: 6,),
                Text(Utils().removeAllHtmlTags(question.question),style: TextStyle(fontFamily: 'Roboto'),overflow: TextOverflow.ellipsis,maxLines: 3,),
                SizedBox(height: 6,),
                Divider(),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.chat,size: 20,color: Colors.black45,),
                    SizedBox(width: 4,),
                    Text(question.comment==0?"Belum ada jawaban":question.comment.toString()+ " Jawaban",style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
