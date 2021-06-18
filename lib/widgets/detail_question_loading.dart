import 'package:chat_socket_getx/widgets/list_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailQuestionLoading extends StatelessWidget {
  var data=[1,2,3,4];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: <Widget>[
          _buildQuestionSection(),
          SizedBox(height: 20,),
          _buildCommentSection()
        ],
      ),
    );
  }

  Widget _buildCommentSection(){
    return Material(
      elevation: 1,
      color: Colors.white,
      child: Container(child:LoadingListSection()),
    );
  }




  Widget _buildQuestionSection(){
    return Material(
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  Shimmer.fromColors(
                    baseColor: Colors.grey[400],
                    highlightColor: Colors.white,
                    child: Container(
                      width:31,
                      height:31,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 6,),
                  Expanded(child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[400],
                          highlightColor: Colors.white,
                          child: Container(
                            color: Colors.white,
                            margin: EdgeInsets.all(5),
                            height: 15,
                          ),
                        ),
                        SizedBox(height: 4,),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[400],
                          highlightColor: Colors.white,
                          child: Container(
                            color: Colors.white,
                            margin: EdgeInsets.all(5),
                            height: 15,
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(height: 6,),
            SizedBox(height: 6,),
            Shimmer.fromColors(
              baseColor: Colors.grey[400],
              highlightColor: Colors.white,
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.all(5),
                height: 15,
              ),
            ),
            SizedBox(height: 6,),
            Shimmer.fromColors(
              baseColor: Colors.grey[400],
              highlightColor: Colors.white,
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.all(5),
                height: 15,
              ),
            ),
            SizedBox(height: 6,),
            Shimmer.fromColors(
              baseColor: Colors.grey[400],
              highlightColor: Colors.white,
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.all(5),
                height: 15,
              ),
            ),
            SizedBox(height: 6,),
          ],
        ),
      ),
    );
  }

}
