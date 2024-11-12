import 'package:formmd/controller.dart';
import 'package:get/get.dart';

class Mybinding extends Bindings{
  @override
  void dependencies() {
    Get.put(mainController());
  }

}