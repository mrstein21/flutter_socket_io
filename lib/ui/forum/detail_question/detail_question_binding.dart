import 'package:get/get.dart';
import 'detail_question_controller.dart';

class DetailQuestionBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DetailQuestionController());
  }

}