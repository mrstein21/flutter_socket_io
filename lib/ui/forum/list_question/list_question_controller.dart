import 'dart:convert';

import 'package:chat_socket_getx/helper/server.dart';
import 'package:chat_socket_getx/helper/user_preference.dart';
import 'package:chat_socket_getx/model/question.dart';
import 'package:chat_socket_getx/repository/forum_repository.dart';
import 'package:chat_socket_getx/routes.dart';
import 'package:chat_socket_getx/widgets/write_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';

class ListQuestionController extends GetxController{
  ///inisiasi alamat socket
  IO.Socket socket = IO.io(Server().url_api,<String, dynamic>{
  'transports': ['websocket']});
  ////tidak perlu menggunakan variable observble karena kita
  ///akan menggunakan GetBuilder untuk update UI nya
  List<Question>list = new List<Question>();
  bool isLoading=true;
  Map<String,dynamic>userCredential = new Map<String,dynamic>();
  ///online user
  List<dynamic>online_user=new List<dynamic>();

  //untuk getCredential user
  void getcrendential()async{
    userCredential=await UserPreference.getCredentialUser();
    socket.emit("online_users",{
      "id":userCredential["id"],
      "name":userCredential["name"]
    });
    print("user credential "+userCredential.toString());
  }

  void logout(){
    ///emit offline untuk delete sambungan user di server
    socket.emit("offline_users",{
      "id":userCredential["id"],
      "name":userCredential["name"]
    });
    ///hapus session dan hentikan service kemudian pindah ke halaman splash
    UserPreference.deleteCredentiallUser().then((value){
      Get.reset();
      Get.offAllNamed(RouterGenerator.routeSplash);
    });
  }

  ///connect ke socket server pada API
  void connectSocket(){
    socket.onConnect((_) {
      print('connect');
      socket.emit('test', 'test');
    });

    ///mendeteksi event question dari server
    ///ketika mendeteksi event question dari server maka kita akan mendapatkan nilai data
    socket.on("question", (var data){
      ///data socket
      print("nilai socket io"+data["data"].toString());
      ///disni tipe data yang dikirim dari event question dari server yaitu Map<String,dynamic>
      ///untuk tipe data beda beda tergantung server yang kirimnya
      list.insert(0,Question.fromJson(data["data"]));
      update();
    });

    ///disini tipe data yang dikirim dari event online users berbentuk list <Map<dynamic>>
    socket.on("online_users", (data){
       print("online users "+data.toString());
       online_user=data;
       ///disini saya cmn update UI yang udah dikasih id online_users saja
       ///sehingga kita tidak perlu mengupdate seluruh UI ketika ada perubahan
       update(["online_users"]);
     }
    );

    ///mendetksi event disconnect
    socket.onDisconnect((data){
      print("disconnect ");
    });
    socket.connect();
  }

  /// mengirim postingan lewat  event question pada Socket...
  /// bisa juga mengirim postingan lewat API asalkan si server mengirim event question
  /// yang diperlukan untuk realtime socket  pada frontend itu adalah event socket dari servernya
  /// supaya bisa di listen/dideteksi di frontend jadi tidak masalah mau dikirim lewat socket
  /// atau API seperti biasa.
  void sendToSocket(String html){
    final f = new DateFormat('yyyy-MM-dd');
    Map<String,dynamic>socketPayload=new Map<String,dynamic>();
    socketPayload={
      "notification": userCredential["name"]+" mengirim sebuah pertanyaan",
      "data":{
        "title":html,
        "date":f.format(DateTime.now()),
        "user_id":userCredential["id"],
      }
    };
    socket.emit("question",socketPayload);
  }


  void getQuestion(){
    //// isLoading dijadikan true dan di update karena nanti di getXBuilder
    ///kita akan menyeleksi isLoading untuk seleksi di UI jika isLoading true maka di UI merubah
    ///tampilannya loading menjadi shimmer loading  jika isLoading false maka di UI akan merubah
    ///tampilannya menjadi list question
    isLoading=true;
    ///untuk update UI menggunakan function update() jika tidak UI tidak akan berubah
    update();
    ForumRepository().getQuestion().then((value){
      list=value;
      isLoading=false;
      update();
    }).catchError((err,track){
      print("kesalahan "+err.toString());
      print("kesalahan "+track.toString());
      Get.snackbar("Pesan","Terjadi kesalahan pada server",snackPosition: SnackPosition.BOTTOM);
    });
  }

  void showWritePost(BuildContext context){
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder:  (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation){
          return WritePost(
            title: "Tulis Pertanyaan",
            onCancel: (){
              Navigator.of(context).pop();
            },
            onFinish: (String html){
              print("hasil zefyr "+html);
              sendToSocket(html);
              Navigator.of(context).pop();
            },
          );
        }
    );
  }

}