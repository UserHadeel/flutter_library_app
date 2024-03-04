import 'package:get/get.dart';
import 'package:library_app/models/journal_model.dart';
import 'package:library_app/repositories/Journal_Repository.dart';

class JournalController extends GetxController {
  var journalList = <JournalModels>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getJournal();
  }

  void getJournal() async {
    var journals = await JournalRepository.getJournal();
    try {
      if (journals != null) {
        isLoading.value = true;
        journalList.assignAll(journals);
      }
    } finally {
      isLoading.value = false;
    }
  }

}