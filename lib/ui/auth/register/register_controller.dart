import 'dart:convert';

import 'package:chat_socket_getx/helper/user_preference.dart';
import 'package:chat_socket_getx/injector.dart';
import 'package:chat_socket_getx/repository/auth_repository.dart';
import 'package:chat_socket_getx/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';

class RegisterController extends GetxController{
  ProgressDialog progressDialog;
  String name="";
  String email="";
  String password="";
  bool isObscured=true;
  ///
  /// nilai untuk mengubah visible dan non visible pada bagian
  /// password yang nantinya di listen oleh GetBuilder
  void changeObscure(bool value){
    isObscured=value;
    ///update nilai menggunakan update jika tidak nilai akan berubah tapi UI
    ///tidak berubah
    update();
  }

  void initProgress(BuildContext context){
    progressDialog=new ProgressDialog(context);
  }


  void register(var formKey){
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      callRegisterService();
    }
  }

  void callRegisterService(){
    progressDialog.style(message: "Loading..");
    progressDialog.show();
    Map<String,dynamic>userCredential=new Map<String,dynamic>();
    ///untuk result json silahkan liat di dokumentasi API di postman
    AuthRepository().registerService(name: name,email: email,password: password).then((value){
      progressDialog.hide().whenComplete(()async{
        var decode_response=json.decode(value);
        if(decode_response["success"]==true){
          userCredential={
            "id":decode_response["data"]["id"].toString(),
            "name":decode_response["data"]["name"],
            "email":decode_response["data"]["email"],
            "token":decode_response["token"]
          };
          ///ketika login berhasil inject service notification
          await setup();
          UserPreference.setCredentialUser(userCredential);
          Get.offAllNamed(RouterGenerator.routeForum);
        }else{
          Get.snackbar("Pesan", decode_response["message"]);
        }
      });
    }).catchError((err,track){
      progressDialog.hide().whenComplete((){
        Get.snackbar("Pesan","Terjadi kesalahan pada server");
      });
    });
  }

}