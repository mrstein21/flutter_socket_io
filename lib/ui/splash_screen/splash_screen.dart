import 'package:chat_socket_getx/ui/splash_screen/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashController controller=Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    controller.startSplashScreen();
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Text("Welcome to SteinAsk",style: TextStyle(
              fontSize: 20,
              color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Pacifico'),),
        ),
      ),
    );
  }
}
