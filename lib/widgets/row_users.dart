import 'package:avatar_letter/avatar_letter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowUsers extends StatelessWidget {
  var online_user;
  String user_id;
  RowUsers({
    this.user_id,
    this.online_user
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AvatarLetter(
            size: 31,
            fontSize: 14,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            upperCase: true,
            letterType: LetterType.Circular,
            text: online_user["name"],
            fontFamily: "Roboto",
          ),
          SizedBox(width: 6,),
          Expanded(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user_id==online_user["id"].toString()?"Anda":online_user["name"],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Roboto"),),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green
                      ),
                      height: 20,
                    ),
                    SizedBox(width: 5,),
                    Text("Online",style: TextStyle(color: Colors.white,fontFamily: "Roboto",fontSize: 12),),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
