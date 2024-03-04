import 'package:get/get.dart';
import 'package:library_app/models/project_model.dart';
import 'package:library_app/repositories/Project_Repository.dart';


class ProjectController extends GetxController {
  var projectList = <ProjectModels>[].obs;
  var projectHomeList = <ProjectModels>[].obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProjects();
  }

  void getProjects() async {
    var projects = await ProjectRepository.getProject();
    try {
      if (projects != null) {
        isLoading.value = true;
        projectList.assignAll(projects);   
        projectHomeList.assignAll(projects); 
  }
    } finally {
      isLoading.value = false;
    }
  }


  void getProjectByDepartment(String depName) {
  update();

  ProjectRepository.getProjectByDepartment(depName).then((projects) {
    projectList.clear(); // مسح العناصر السابقة من القائمة
    projectList.assignAll(projects);
    isLoading.value = false;
    update();
  }).catchError((error) {
    isLoading.value = false;
    update();
    // Handle the error
  });
  }

}