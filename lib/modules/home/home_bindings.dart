import 'package:get/get.dart';
import 'package:infinite_scroll_getx/modules/home/controller/home_controller.dart';
import 'package:infinite_scroll_getx/repositories/user_repository.dart';

class HomeBindings implements Bindings {
   
   @override
   void dependencies() {
     Get.lazyPut(() => UserRepository(Get.find()));
     Get.lazyPut(() => HomeController(Get.find()));
   }
}