import 'package:chat_socket_getx/ui/auth/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RegisterController());
    // TODO: implement dependencies
  }

}