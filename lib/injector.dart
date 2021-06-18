import 'package:chat_socket_getx/service/socket_io_notification_service.dart';
import 'package:chat_socket_getx/ui/auth/login/login_controller.dart';
import 'package:chat_socket_getx/ui/auth/register/register_controller.dart';
import 'package:chat_socket_getx/ui/forum/detail_question/detail_question_controller.dart';
import 'package:chat_socket_getx/ui/forum/list_question/list_question_controller.dart';
import 'package:get/get.dart';

void setup() async{
  await Get.putAsync(() => SocketIONotificationService().init());
}