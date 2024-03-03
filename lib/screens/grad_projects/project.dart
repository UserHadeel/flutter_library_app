import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/components/primary_header_container.dart';
import 'package:library_app/controllers/DepartmentController.dart';
import 'package:library_app/controllers/ProjectController.dart';
import 'package:library_app/screens/grad_projects/project_card.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  TextEditingController txtSearch = TextEditingController();
  late ProjectController projectController;
  late DepartmentController departmentController;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    projectController = Get.put<ProjectController>(ProjectController());
    departmentController = Get.put<DepartmentController>(DepartmentController());
  }

  void _onSearch(String value) {
    setState(() {
      searchQuery = value.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        elevation: 0,
        title: Align(
          alignment: Alignment.topRight,
          child: Text(
            "قائمة المشاريع",
            style: TextStyle(color: TColor.wtext),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 60,
              child: GetX<DepartmentController>(
                builder: (departmentController) {
                  var departmentList = departmentController.departmentList;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: departmentList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // زر "الكل"
                        return Obx(() => Container(
                              padding: const EdgeInsets.all(3),
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: TColor.primary,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                color: departmentController.selectedIndex.value ==
                                        0
                                    ? TColor
                                        .primary // لون الخلفية الأخضر عند التحديد
                                    : Colors.white,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  departmentController.updateSelectedIndex(0);
                                  projectController.getProjects();
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: departmentController
                                              .selectedIndex.value ==
                                          0
                                      ? Colors
                                          .white // لون النص الأبيض عند التحديد
                                      : TColor.primary,
                                ),
                                child: Text(
                                  'الكل',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: departmentController
                                                .selectedIndex.value ==
                                            0
                                        ? Colors
                                            .white // لون النص الأبيض عند التحديد
                                        : TColor.primary,
                                  ),
                                ),
                              ),
                            ));
                      }
                      var department = departmentList[index - 1];
                      return Obx(() => Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: TColor.primary,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(50),
                              color: departmentController.selectedIndex.value ==
                                      index
                                  ? TColor.primary
                                  : Colors.white,
                            ),
                            child: TextButton(
                              onPressed: () {
                                departmentController.updateSelectedIndex(index);
                                projectController.getProjectByDepartment(department.name);
                                    print(department.name);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: departmentController
                                            .selectedIndex.value ==
                                        index
                                    ? Colors
                                        .white // لون النص الأبيض عند التحديد
                                    : TColor.primary,
                              ),
                              child: Text(
                                department.name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: departmentController
                                              .selectedIndex.value ==
                                          index
                                      ? Colors
                                          .white // لون النص الأبيض عند التحديد
                                      : TColor.primary,
                                ),
                              ),
                            ),
                          ));
                    },
                  );
                },
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextField(
                  controller: txtSearch,
                  onChanged: _onSearch,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'ابحث عن مشروع',
                    hintStyle: TextStyle(color: TColor.primary),
                    prefixIcon: Icon(
                      Icons.search,
                      color: TColor.primary,
                    ),
                    suffixIcon: searchQuery.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                txtSearch.clear();
                                searchQuery = '';
                              });
                            },
                            icon: Icon(Icons.clear, color: TColor.primary),
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: TColor.primary,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: TColor.primary,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 8,
              child: GetX<ProjectController>(
                builder: (projectController) {
                  if (projectController.isLoading == true) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: TColor.primary,
                      ),
                    );
                  } else {
                    final filteredProject= projectController.projectList.where((project) {
                      return searchQuery.isEmpty ||
                          project.title.contains(searchQuery) ||
                          project.studentName.contains(searchQuery)||
                           project.year.contains(searchQuery);
                    }).toList();

                    if (filteredProject.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: Column(
                            children: [
                              Icon(
                                Icons.warning,
                                color: TColor.primary,
                                size: 30,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "لا يوجد مشاريع ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: filteredProject.length,
                        itemBuilder: (context, index) {
                          final project = filteredProject[index];
                          return ProjectCardItemWidget(
                            image: project.image,
                            title: project.title,
                            studentName: project.studentName,
                            year: project.year,
                          );
                        },
                      );
                    }
                  }
                },
              ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
