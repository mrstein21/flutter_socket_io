import 'package:chat_socket_getx/helper/server.dart';
import 'package:chat_socket_getx/helper/user_preference.dart';
import 'package:chat_socket_getx/model/answer.dart';
import 'package:chat_socket_getx/model/question.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ForumRepository {
  Future<List<Question>> getQuestion() async {
    var userSession=await UserPreference.getCredentialUser();
    var response=await http.get(Server().url_api+"/forum/question",headers: {
      "Authorization":"Bearer "+userSession["token"]
    });
    print("response question "+response.body);
    if(response.statusCode==200){
      return compute(listQuestionFromJson,response.body);
    }else{
      throw Exception();
    }
  }


  Future<List<Question>> getYourQuestion() async {
    var userSession=await UserPreference.getCredentialUser();
    var response=await http.post(
        Server().url_api+"/forum/question",body:{
        "user_id":userSession["id"]
    },headers: {
      "Authorization":"Bearer "+userSession["token"]
    });
    print("response your question "+response.body);
    if(response.statusCode==200){
      return compute(listQuestionFromJson,response.body);
    }else{
      throw Exception();
    }
  }

  Future<List<Answer>> getAnswer(int id) async {
    var userSession=await UserPreference.getCredentialUser();
    var response=await http.get(Server().url_api+"/forum/question/answer/"+id.toString(),headers: {
      "Authorization":"Bearer "+userSession["token"]
    });
    print("response answer "+response.body);
    if(response.statusCode==200){
      return compute(listAnswerFromJson,response.body);
    }else{
      throw Exception();
    }
  }

}