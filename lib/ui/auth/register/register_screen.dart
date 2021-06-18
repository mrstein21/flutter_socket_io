import 'package:chat_socket_getx/routes.dart';
import 'package:chat_socket_getx/ui/auth/login/login_controller.dart';
import 'package:chat_socket_getx/ui/auth/register/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterController controller=Get.find<RegisterController>();
  var formKey=new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controller.initProgress(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: Center(child: _buildFormRegister()),
      ),
    );
  }

  Widget _buildFormRegister() {
    return ListView(
      children: [
        SizedBox(height: 50,),
        Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("SteinAsk",style: TextStyle(fontSize:30,fontFamily: "Montserrat",fontWeight: FontWeight.bold,color: Colors.white),),
                SizedBox(height: 10,),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "Nama harus diisi";
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    controller.name = value;
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    fillColor: Colors.white,
                      errorStyle: TextStyle(
                          color: Colors.white
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Nama",
                      hintStyle: TextStyle(color: Colors.white)

                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "Email harus diisi";
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    controller.email = value;
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                      errorStyle: TextStyle(
                          color: Colors.white
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GetBuilder<RegisterController>(
                    init: RegisterController(),
                    builder: (value){
                      return TextFormField(
                        validator: (value){
                          if(value.isEmpty){
                            return "Password harus diisi";
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          controller.password = value;
                        },

                        obscureText: value.isObscured,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                          focusColor: Colors.white,
                          errorStyle: TextStyle(
                              color: Colors.white
                          ),
                          suffixIcon: InkWell(
                              onTap: (){
                                if(value.isObscured==true){
                                  controller.changeObscure(false);
                                }else{
                                  controller.changeObscure(true);
                                }
                              },
                              child: value.isObscured==true?Icon(Icons.visibility,color: Colors.white,):Icon(Icons.visibility_off,color: Colors.white,)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      );
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      onPressed: () async {
                        await controller.register(formKey);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Text("Masuk",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto")),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: (){
                      Get.toNamed(RouterGenerator.routeLogin);
                    },
                    child: Text("Sudah punya akun ? Login disini",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Roboto"),)
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

}
