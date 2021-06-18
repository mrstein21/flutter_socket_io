import 'dart:convert';

import 'package:chat_socket_getx/injector.dart';
import 'package:chat_socket_getx/routes.dart';
import 'package:chat_socket_getx/ui/auth/login/login_binding.dart';
import 'package:chat_socket_getx/ui/auth/login/login_screen.dart';
import 'package:chat_socket_getx/ui/auth/register/register_binding.dart';
import 'package:chat_socket_getx/ui/auth/register/register_screen.dart';
import 'package:chat_socket_getx/ui/forum/detail_question/detail_question_binding.dart';
import 'package:chat_socket_getx/ui/forum/detail_question/detail_question_screen.dart';
import 'package:chat_socket_getx/ui/forum/list_question/list_question_binding.dart';
import 'package:chat_socket_getx/ui/forum/list_question/list_question_screen.dart';
import 'package:chat_socket_getx/ui/forum/your_question_screen/your_question_binding.dart';
import 'package:chat_socket_getx/ui/forum/your_question_screen/your_question_screen.dart';
import 'package:chat_socket_getx/ui/splash_screen/splash_binding.dart';
import 'package:chat_socket_getx/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      ///disini atribut binding untuk injector controllernya
      getPages: [
        GetPage(
            binding: ListQuestionBinding() ,
            name: RouterGenerator.routeForum,
            page:()=>ListQuestionScreen()
        ),
        GetPage(
            binding: DetailQuestionBinding(),
            name: RouterGenerator.routeDetail,
            page:()=>DetailQuestionScreen()),
        GetPage(
            binding: LoginBinding(),
            name: RouterGenerator.routeLogin,
            page:()=>LoginScreen()),
        GetPage(
            binding: RegisterBinding(),
            name: RouterGenerator.routeRegister,
            page:()=>RegisterScreen()),
        GetPage(
            binding: YourQuestionBinding(),
            name: RouterGenerator.routeYourQuestion,
            page:()=>YourQuestionScreen()),
        GetPage(
            binding: SplashBinding(),
            name: RouterGenerator.routeSplash,
            page:()=>SplashScreen())
      ],
      initialRoute: RouterGenerator.routeSplash,
    );
  }


}


