import 'package:get/get.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/repositories/book_repository.dart';

class BookController extends GetxController {
  var bookList = <BookModels>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getBooks();
  }

  void getBooks() async {
    var books = await BookRepository.getBook();
    try {
      if (books != null) {
        isLoading.value = true;
        bookList.assignAll(books);
      }
    } finally {
      isLoading.value = false;
    }
  }


  void getBooksByCategory(String catName) {
    update();

    BookRepository.getBooksByCategory(catName).then((books) {
      bookList.clear(); 
      bookList.assignAll(books);
      isLoading.value  = false;
      update();
    }).catchError((error) {
      isLoading.value  = false;
      update();
      // Handle the error
    });
  }

}