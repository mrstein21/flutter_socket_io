import 'dart:async';

import 'package:chat_socket_getx/helper/user_preference.dart';
import 'package:chat_socket_getx/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  startSplashScreen()async{
    UserPreference.getCredentialUser().then((value){
      var duration = const Duration(seconds: 2);
      return Timer(duration, () {
        ///cek session
        if (value["id"] == null) {
          Get.offNamed(RouterGenerator.routeLogin);
        } else {
          Get.offNamed(RouterGenerator.routeForum);
        }
      });
    });
  }
}