import 'package:get/get.dart';
import 'package:library_app/models/department_model.dart';
import 'package:library_app/repositories/Department_Repository.dart';


class DepartmentController extends GetxController {
  var departmentList =<DepartmentModels>[].obs;
  RxBool isLoading = true.obs;
  var selectedIndex = 0.obs;


  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit(){
    super.onInit();
     getDepartment();  
  }

 void getDepartment() async {
  var department = await DepartmentRepository.getDepartment();

  try {
    if (department != null) {
      isLoading.value = true;
      departmentList.addAll(department);
    }
  } finally {
    isLoading.value = false;
  }
}
}
