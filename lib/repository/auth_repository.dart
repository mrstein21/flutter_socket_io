import 'dart:convert';

import 'package:chat_socket_getx/helper/server.dart';
import 'package:http/http.dart' as http;

class AuthRepository{
  Future<String>loginService({String email,String password})async{
    print(email);
    print(password);
    var res = await http.post(Server().url_api+"/auth/login", body : json.encode({
      "email"       : email,
      "password"    : password,
    }),headers: {
      "Content-Type":"application/json"
    });
    print(" response login "+res.body);
    if (res.statusCode == 200) {
      return res.body;
    }else{
      throw Exception();
    }
  }


  Future<String>registerService({String email,String name,String password})async{
    var res = await http.post(Server().url_api+"/auth/register", body : {
      "name"        : name,
      "email"       : email,
      "password"    : password,
    });
    print(" response register "+res.body);
    if (res.statusCode == 200) {
      return res.body;
    }else{
      throw Exception();
    }
  }


}