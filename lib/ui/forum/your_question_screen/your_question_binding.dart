import 'package:chat_socket_getx/ui/forum/your_question_screen/your_question_controller.dart';
import 'package:get/get.dart';

class YourQuestionBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(YourQuestionController());
    // TODO: implement dependencies
  }

}