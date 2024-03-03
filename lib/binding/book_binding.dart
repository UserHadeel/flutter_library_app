

import 'package:get/get.dart';
import 'package:library_app/controllers/BookController.dart';

class BookBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BookController());
  }

}