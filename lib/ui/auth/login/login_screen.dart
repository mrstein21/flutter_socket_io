import 'package:chat_socket_getx/routes.dart';
import 'package:chat_socket_getx/ui/auth/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginController controller=Get.find<LoginController>();
  var formKey=new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controller.initProgress(context);
    return Scaffold(
     body: Container(
       width: double.infinity,
       height: double.infinity,
       color: Colors.red,
       child: Center(child: _buildFormLogin()),
     ),
    );
  }

  Widget _buildFormLogin() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("SteinAsk",style: TextStyle(fontSize:30,fontFamily: "Montserrat",fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 20,),
            TextFormField(
              cursorColor: Colors.white,
              validator: (value){
                if(value.isEmpty){
                  return "Email harus diisi";
                }
                return null;
              },
              onSaved: (String value) {
                controller.email = value;
              },
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  errorStyle: TextStyle(
                    color: Colors.white
                  ),
                fillColor: Colors.white,
                hoverColor: Colors.white,
                focusColor: Colors.white,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.white),
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
            GetBuilder<LoginController>(
                init: LoginController(),
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
                      errorStyle: TextStyle(
                          color: Colors.white
                      ),
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      focusColor: Colors.white,
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),//KETIKA obsecureText bernilai TRUE
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
                    await controller.login(formKey);
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
                     Get.toNamed(RouterGenerator.routeRegister);
                },
                child: Text("Belum punya akun ? Daftar disini",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Roboto"),)
            )
          ],
        ),
      ),
    );
  }

}
