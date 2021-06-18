import 'package:avatar_letter/avatar_letter.dart';
import 'package:chat_socket_getx/routes.dart';
import 'package:chat_socket_getx/ui/forum/list_question/list_question_controller.dart';
import 'package:chat_socket_getx/widgets/list_loading.dart';
import 'package:chat_socket_getx/widgets/row_question.dart';
import 'package:chat_socket_getx/widgets/row_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ListQuestionScreen extends StatefulWidget {
  @override
  _ListQuestionScreenState createState() => _ListQuestionScreenState();
}

class _ListQuestionScreenState extends State<ListQuestionScreen> {
  ListQuestionController controller=Get.find<ListQuestionController>();
  Future<void>refresh()async{
    controller.getQuestion();
    return null;
  }

  @override
  void initState() {
    controller.getQuestion();
    controller.connectSocket();
    controller.getcrendential();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(8),
          color: Colors.red,
          child: ListView(
            children: [
              Text("SteinAsk",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Roboto",fontSize: 18),),
              SizedBox(height: 5,),
              Text("Active User",style: TextStyle(color: Colors.white,fontFamily: "Roboto",fontWeight: FontWeight.bold,fontSize: 12),),
              SizedBox(height: 5,),
              Divider(color: Colors.white,),
              SizedBox(height: 5,),
              //get builder untuk listen  Update UI ketika ada perubahan nilai di GetXController
              /// dikasih params id supaya ketika update scope ini saja yang di update UInya
              GetBuilder<ListQuestionController>(
                id: "online_users",
                init: ListQuestionController(),
                ///bisa akses variable ListQuestionController
                ///dari parameter value atau juga dari controller langsung bisa.
                builder:(value)=> ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.online_user.length,
                  itemBuilder: (c,index){
                    return RowUsers(user_id: controller.userCredential["id"],online_user: controller.online_user[index],);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              onSelected: (value){
                if(value==1){
                  Get.toNamed(RouterGenerator.routeYourQuestion);
                }else if(value==2){
                  controller.logout();
                }
              },
              itemBuilder: (conext)=>[
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.list_alt,size: 20,color: Colors.black,),
                      SizedBox(width: 3,),
                      Text("Your Question")
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.power_settings_new_outlined,size: 20,color: Colors.black,),
                      SizedBox(width: 3,),
                      Text("Logout")
                    ],
                  ),
                )
              ]
          )
        ],
        title: Text("SteinAsk",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat"),),
      ),
      body: Container(
        child: RefreshIndicator(
          onRefresh: refresh,
          //get builder untuk listen  Update UI ketika ada perubahan nilai di GetXController
          child: GetBuilder<ListQuestionController>(
            init: ListQuestionController(),
            builder: (value){
              ///bisa akses variable ListQuestionController
              ///dari parameter value atau juga dari controller langsung bisa.
              if(value.isLoading==true){
                return LoadingListSection();
              }else{
                return _buildListView();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.showWritePost(context);
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }

  Widget _buildListView(){
    return ListView.builder(
        itemCount: controller.list.length,
        itemBuilder: (ctx,index)=>RowQuestion(question: controller.list[index],));
  }

}


