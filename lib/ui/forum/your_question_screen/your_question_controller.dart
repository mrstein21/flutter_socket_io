import 'package:chat_socket_getx/model/question.dart';
import 'package:chat_socket_getx/repository/forum_repository.dart';
import 'package:chat_socket_getx/ui/forum/list_question/list_question_binding.dart';
import 'package:get/get.dart';

class YourQuestionController extends GetxController{
  List<Question>list=new List<Question>();
  bool isLoading=true;
  void getQuestion(){
    //// isLoading dijadikan true dan di update karena nanti di getXBuilder
    ///kita akan menyeleksi isLoading untuk seleksi di UI jika isLoading true maka di UI merubah
    ///tampilannya loading menjadi shimmer loading  jika isLoading false maka di UI akan merubah
    ///tampilannya menjadi list question
    isLoading=true;
    ///untuk update UI menggunakan function update() jika tidak UI tidak akan berubah
    update();
    ForumRepository().getYourQuestion().then((value){
      list=value;
      isLoading=false;
      update();
    }).catchError((err,track){
      print("kesalahan "+err.toString());
      print("kesalahan "+track.toString());
      Get.snackbar("Pesan","Terjadi kesalahan pada server",snackPosition: SnackPosition.BOTTOM);
    });
  }
}