import 'package:chat_socket_getx/ui/forum/your_question_screen/your_question_controller.dart';
import 'package:chat_socket_getx/widgets/list_loading.dart';
import 'package:chat_socket_getx/widgets/row_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourQuestionScreen extends StatefulWidget {
  @override
  _YourQuestionScreenState createState() => _YourQuestionScreenState();
}

class _YourQuestionScreenState extends State<YourQuestionScreen> {
  YourQuestionController controller =Get.find<YourQuestionController>();

  Future<void>refresh()async{
    controller.getQuestion();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    controller.getQuestion();
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Question"),
      ),
      body: Container(
        child: RefreshIndicator(
          onRefresh: refresh,
          //get builder untuk listen  Update UI ketika ada perubahan nilai di GetXController
          child: GetBuilder<YourQuestionController>(
            init: YourQuestionController(),
            builder: (value){
              ///bisa akses variable YourQuestionController
              ///dari parameter value atau juga dari controller langsung bisa.
              if(value.isLoading==true){
                return LoadingListSection();
              }else{
                if(controller.list.isEmpty){
                  return _buildRowEMpty();
                }
                return _buildListView();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRowEMpty(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.list_alt,size: 50,),
          SizedBox(height: 10,),
          Text("Daftar Pertanyaanmu masih kosong",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18),)
        ],
      ),
    );
  }

  Widget _buildListView(){
    return ListView.builder(
        itemCount: controller.list.length,
        itemBuilder: (ctx,index)=>RowQuestion(question: controller.list[index],));
  }


}
