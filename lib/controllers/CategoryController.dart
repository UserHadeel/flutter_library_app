import 'package:get/get.dart';
import 'package:library_app/models/category_model.dart';
import 'package:library_app/repositories/Category_Repository.dart';


class CategoryController extends GetxController {
  var categoryList =<CategoryModels>[].obs;
  RxBool isLoading = true.obs;
  var selectedIndex = 0.obs;



  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }


  @override
  void onInit(){
    super.onInit();
     getCategorys();
  
    
  }

 void getCategorys() async {
  var categories = await CategoryRepository.getCategory();

  try {
    if (categories != null) {
      isLoading.value = true;
      categoryList.addAll(categories);
    }
  } finally {
    isLoading.value = false;
  }
}
}
