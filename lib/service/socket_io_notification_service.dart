import 'package:chat_socket_getx/helper/server.dart';
import 'package:chat_socket_getx/helper/utils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

/// class untuk notifikasi Socket IO yang nantinya dijalankan Getx Service
class SocketIONotificationService extends GetxService{
  static FlutterLocalNotificationsPlugin notifications =
  FlutterLocalNotificationsPlugin();

  ///inisiasi alamat socket
  IO.Socket socket = IO.io(Server().url_api,<String, dynamic>{
    'transports': ['websocket']});


  Future onSelectNotification(String payload) async {
    print("selected notification ? "+payload);
  }

  Future<void> init(){
    print("starting service....");
    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) {
          onSelectNotification(body);
        }
    );
    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);

    var platformChannelSpecifics = new NotificationDetails(
      Utils().specificNotificationAndroid(),
      Utils().specificIosNotification()
    );

    socket.on("question", (var data){
      print("terdeteksi question");
    ///data socket
    ///disni tipe data yang dikirimnya dari server yaitu Map<String,dynamic>
       notifications.show(
          0,
          "Pemberitahuan",
          data["notification"],
          platformChannelSpecifics,
          payload:  data["click_action"]
      );
    });

    socket.on("notification", (var data){
      print("terdeteksi answer");
      ///data socket
      ///disni tipe data yang dikirimnya dari server yaitu Map<String,dynamic>
      notifications.show(
          0,
          "Pemberitahuan",
          data["notification"],
          platformChannelSpecifics,
          payload:  data["click_action"]
      );
    });

    socket.connect();
  }
}