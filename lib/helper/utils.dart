import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';


class Utils{
  String getDiff(String date) {
    final f = new DateFormat('dd/MMM/ yyyy');
    DateTime dates = DateTime.parse(date);
    return f.format(dates);
  }

  String removeAllHtmlTags(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body.text).documentElement.text;
    return parsedString;
  }


 AndroidNotificationDetails specificNotificationAndroid(){
    var platformChannelSpecificsAndroid = new AndroidNotificationDetails(
        '115', 'forum_notification', 'Notification SteinAsk',
        playSound: true,
        enableVibration: true,
        enableLights: true,
        importance: Importance.Max,
        priority: Priority.High);
    return platformChannelSpecificsAndroid;
  }

  IOSNotificationDetails specificIosNotification(){
    var platformChannelSpecificsIos =
    new IOSNotificationDetails(presentSound: false,);
    return platformChannelSpecificsIos;
  }

}